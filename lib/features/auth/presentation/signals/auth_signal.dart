import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:weather_project/features/auth/domain/entities/user_entity.dart';
import 'package:weather_project/features/auth/domain/usecases/sign_in_usecase.dart';

@lazySingleton
class AuthSignal {
  final SignInUseCase signInUseCase;
  AuthSignal(this.signInUseCase);
  Signal<bool> isLoading = Signal(false);
  Signal<String> error = Signal('');
  Signal<UserEntity?> user = Signal(null);
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> handleLogin(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    final success = await signIn(emailController.text, passwordController.text);
    if (success && context.mounted) {
      context.goNamed('home');
    }
  }

  Future<bool> signIn(String email, String password) async {
    isLoading.value = true;
    error.value = '';
    try {
      final result = await signInUseCase(email, password);
      return result.fold((failure) {
        return false;
      }, (userEntity) {
        user.value = userEntity;
        return true;
      });
    } finally {
      isLoading.value = false;
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void reset() {
    isLoading.value = false;
    error.value = '';
    user.value = null;
    emailController.clear();
    passwordController.clear();
  }
}
