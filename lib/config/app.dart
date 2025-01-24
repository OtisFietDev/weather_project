import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:weather_project/config/routes/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Watch(
      (context) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
