import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:signals/signals_flutter.dart';
import 'package:weather_project/features/auth/presentation/signals/auth_signal.dart';
import 'package:weather_project/injectable.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authSignal = sl<AuthSignal>();

    return Scaffold(
      body: Container(
        decoration: _buildGradientBackground(),
        child: Center(
          child: _buildLoginForm(context, authSignal),
        ),
      ),
    );
  }

  BoxDecoration _buildGradientBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF6B46C1), Color(0xFFDB2777)],
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, AuthSignal authSignal) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      width: 350,
      decoration: _buildFormContainerDecoration(),
      child: Form(
        key: authSignal.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTitle(context),
            const Gap(24),
            _buildEmailField(authSignal),
            const Gap(16),
            _buildPasswordField(authSignal),
            const Gap(24),
            _buildLoginButton(authSignal),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildFormContainerDecoration() {
    return BoxDecoration(
      color: Colors.white.withValues(alpha: .1),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white.withValues(alpha: .2)),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Login',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildEmailField(AuthSignal authSignal) {
    return TextFormField(
      controller: authSignal.emailController,
      decoration: _buildInputDecoration('Email'),
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField(AuthSignal authSignal) {
    return TextFormField(
      controller: authSignal.passwordController,
      decoration: _buildInputDecoration('Password'),
      style: const TextStyle(color: Colors.white),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }

  InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: .3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.white),
      ),
    );
  }

  Widget _buildLoginButton(AuthSignal authSignal) {
    return Watch((context) {
      final isLoading = authSignal.isLoading.value;
      final error = authSignal.error.value;

      if (error.isNotEmpty) {
        return Text(
          error,
          style: const TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        );
      }

      return ElevatedButton(
        onPressed: isLoading ? null : () => authSignal.handleLogin(context),
        style: _buildButtonStyle(),
        child: _buildButtonChild(isLoading),
      );
    });
  }

  ButtonStyle _buildButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildButtonChild(bool isLoading) {
    return isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          )
        : const Text(
            'Login',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF6B46C1),
              fontWeight: FontWeight.bold,
            ),
          );
  }
}
