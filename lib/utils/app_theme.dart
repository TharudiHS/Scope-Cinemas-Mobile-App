import 'package:flutter/material.dart';
import 'app_colours.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColours.darkBlue,
      fontFamily: 'Sofia Pro',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColours.white),
      ),
    );
  }
}
