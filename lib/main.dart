import 'package:flutter/material.dart';
import 'package:weather_project/config/app.dart';
import 'package:weather_project/injectable.dart';

void main() async {
  await configureDependencies();

  runApp(const App());
}
