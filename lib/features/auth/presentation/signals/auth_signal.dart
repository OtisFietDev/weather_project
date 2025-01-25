import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:weather_project/config/routes/router.dart';
import 'package:weather_project/core/network/error/failures.dart';
import 'package:weather_project/features/auth/domain/entities/sign_in_entity.dart';
import 'package:weather_project/features/auth/domain/entities/user_entity.dart';
import 'package:weather_project/features/auth/domain/usecases/sign_in_usecase.dart';

@lazySingleton
class AuthSignal {
  final SignInUseCase _signInUseCase;
  final _signInFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Signals
  final _isSigningLoading = Signal(false);
  final _error = Signal('');
  final _user = Signal<UserEntity?>(null);

  // Getters
  GlobalKey<FormState> get signInFormKey => _signInFormKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  Signal<bool> get isSigningLoading => _isSigningLoading;
  Signal<String> get error => _error;
  Signal<UserEntity?> get user => _user;

  AuthSignal(this._signInUseCase);

  Future<void> handleLogin(BuildContext context) async {
    if (!_isFormValid()) return;

    final credentials = _getCredentials();
    final success = await _authenticateUser(credentials);
    log('credentials: $credentials');
    if (success && context.mounted) {
      _resetState();
      _navigateToHome(context);
    }
  }

  bool _isFormValid() => _signInFormKey.currentState?.validate() ?? false;

  SignInEntity _getCredentials() => SignInEntity(
        email: _emailController.text,
        password: _passwordController.text,
      );

  Future<bool> _authenticateUser(SignInEntity credentials) async {
    _startLoading();

    try {
      final result = await _signInUseCase(credentials);

      return result.fold(
        _handleFailure,
        _handleSuccess,
      );
    } finally {
      _stopLoading();
    }
  }

  void _startLoading() {
    _isSigningLoading.value = true;
    _error.value = '';
  }

  void _stopLoading() {
    _isSigningLoading.value = false;
  }

  bool _handleFailure(Failure failure) {
    _error.value = failure.errorMessage!;
    return false;
  }

  bool _handleSuccess(UserEntity userEntity) {
    _user.value = userEntity;
    return true;
  }

  void _navigateToHome(BuildContext context) {
    context.goNamed(AppRoutePath.home.name);
  }

  void _resetState() {
    _isSigningLoading.value = false;
    _error.value = '';
    _user.value = null;
    _emailController.clear();
    _passwordController.clear();
  }
}
