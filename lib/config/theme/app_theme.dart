import 'package:events/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      inputDecorationTheme: inputDecorationThemeData(),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
        ),
      ),
      appBarTheme: AppBarTheme(backgroundColor: AppColors.background),
      textTheme: TextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          foregroundColor: Colors.white
        )
      )
    );
  }

  static InputDecorationThemeData inputDecorationThemeData() {
    return InputDecorationThemeData(
      hintStyle: TextStyle(color: Colors.black38),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.black8),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.black8),
      ),
    );
  }
}
