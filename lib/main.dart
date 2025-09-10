import 'package:flutter/material.dart';
import 'utils/app_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const ScopeCinemaApp());
}

class ScopeCinemaApp extends StatelessWidget {
  const ScopeCinemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scope Cinema App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
