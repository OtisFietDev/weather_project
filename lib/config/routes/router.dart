import 'package:go_router/go_router.dart';
import 'package:weather_project/features/auth/presentation/pages/login_page.dart';
import 'package:weather_project/features/root/home_page.dart';

enum AppRoutePath {
  login,
  home;

  String get relativePath {
    switch (this) {
      case home:
        return '/home';
      case login:
        return '/login';
    }
  }
}

class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoutePath.login.relativePath,
    routes: [
      GoRoute(
        path: AppRoutePath.login.relativePath,
        name: AppRoutePath.login.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutePath.home.relativePath,
        name: AppRoutePath.home.name,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
