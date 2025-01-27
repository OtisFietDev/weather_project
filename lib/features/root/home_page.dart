import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_project/config/routes/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _buildGradientBackground(),
        child: Center(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
            builder: (context, double value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 50 * (1 - value)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildWeatherCard(),
                      const Gap(16),
                      _buildPowerButton(context),
                    ],
                  ),
                ),
              );
            },
          ),
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

  Widget _buildWeatherCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      width: 250,
      decoration: _buildCardDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDateTimeLocation(),
          const Gap(16),
          _buildWeatherIcon(),
          const Gap(16),
          _buildTemperature(),
          const Gap(16),
          _buildForecastIcons(),
        ],
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      color: Colors.white.withValues(alpha: .1),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white.withValues(alpha: .2)),
    );
  }

  Widget _buildDateTimeLocation() {
    return const Column(
      children: [
        Text('Monday, 27th april', style: TextStyle(color: Colors.white, fontSize: 12)),
        Text('6:27am', style: TextStyle(color: Colors.white, fontSize: 24)),
        Text('London', style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Widget _buildWeatherIcon() {
    return const Icon(Icons.cloud, color: Colors.white, size: 48);
  }

  Widget _buildTemperature() {
    return const Column(
      children: [
        Text(
          '10°',
          style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text(
          'Monday',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildForecastIcons() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.cloud, color: Colors.white, size: 16),
        Icon(Icons.cloud, color: Colors.white, size: 16),
        Icon(Icons.wb_sunny, color: Colors.white, size: 16),
        Icon(Icons.cloud, color: Colors.white, size: 16),
      ],
    );
  }

  Widget _buildPowerButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.power_settings_new),
          iconSize: 20,
          color: Colors.white,
          onPressed: () => context.goNamed(AppRoutePath.login.name),
        ),
        IconButton(
          icon: const Icon(Icons.list_alt_rounded),
          iconSize: 20,
          color: Colors.white,
          onPressed: () => context.goNamed(AppRoutePath.weatherList.name),
        ),
      ],
    );
  }
}
