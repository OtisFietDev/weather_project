import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:weather_project/config/routes/router.dart';
import 'package:weather_project/core/network/error/failures.dart';
import 'package:weather_project/features/auth/domain/entities/login_entity.dart';
import 'package:weather_project/features/auth/domain/entities/user_entity.dart';
import 'package:weather_project/features/auth/domain/usecases/sign_in_usecase.dart';

@lazySingleton
class AuthSignal {
  final SignInUseCase _signInUseCase;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Signals
  final _isLoading = Signal(false);
  final _error = Signal('');
  final _user = Signal<UserEntity?>(null);

  // Getters
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  Signal<bool> get isLoading => _isLoading;
  Signal<String> get error => _error;
  Signal<UserEntity?> get user => _user;

  AuthSignal(this._signInUseCase);

  Future<void> handleLogin(BuildContext context) async {
    if (!_isFormValid()) return;

    final credentials = _getCredentials();
    final success = await _authenticateUser(credentials);

    if (success && context.mounted) {
      _dispose();
      _navigateToHome(context);
    }
  }

  bool _isFormValid() => _formKey.currentState?.validate() ?? false;

  LoginEntity _getCredentials() => LoginEntity(
        email: _emailController.text,
        password: _passwordController.text,
      );

  Future<bool> _authenticateUser(LoginEntity credentials) async {
    _startLoading();

    try {
      final result = await _signInUseCase(credentials.email, credentials.password);

      return result.fold(
        _handleFailure,
        _handleSuccess,
      );
    } finally {
      _stopLoading();
    }
  }

  void _startLoading() {
    _isLoading.value = true;
    _error.value = '';
  }

  void _stopLoading() {
    _isLoading.value = false;
  }

  bool _handleFailure(Failure failure) => false;

  bool _handleSuccess(UserEntity userEntity) {
    _user.value = userEntity;
    return true;
  }

  void _navigateToHome(BuildContext context) {
    context.goNamed(AppRoutePath.home.name);
  }

  void _dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _resetState();
  }

  void _resetState() {
    _isLoading.value = false;
    _error.value = '';
    _user.value = null;
    _emailController.clear();
    _passwordController.clear();
  }
}
