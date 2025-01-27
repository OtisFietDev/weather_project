import 'package:go_router/go_router.dart';
import 'package:weather_project/features/auth/presentation/pages/sign_in_page.dart';
import 'package:weather_project/features/root/home_page.dart';
import 'package:weather_project/features/weather/presentation/pages/weather_list_page.dart';

enum AppRoutePath {
  login,
  home,
  weatherList;

  String get relativePath {
    switch (this) {
      case home:
        return '/home';
      case login:
        return '/signin';
      case weatherList:
        return '/weather-list';
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
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
          path: AppRoutePath.home.relativePath,
          name: AppRoutePath.home.name,
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: AppRoutePath.weatherList.relativePath,
              name: AppRoutePath.weatherList.name,
              builder: (context, state) => const WeatherListPage(),
            ),
          ]),
    ],
  );
}
