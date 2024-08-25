import 'package:flutter/material.dart';
import 'package:flutter_mayar/utils/app_colors.dart';

import '../utils/app_style.dart';

class MyThemeData {
  static ThemeData ligthTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          size: 30,
          color: AppColors.accent,
        ),
        centerTitle: true,
        titleTextStyle: AppStyle.appBartextstyle),
    dividerTheme:
        const DividerThemeData(color: AppColors.primary, thickness: 5),
    iconTheme: const IconThemeData(
      size: 30,
      color: AppColors.primary,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.accent,
        unselectedItemColor: Colors.white,
        backgroundColor: AppColors.primary),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: AppColors.accent,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: AppColors.accent,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: AppColors.accent,
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme: const ColorScheme(
      onPrimary: AppColors.accent,
      secondary: AppColors.accent,
      primary: AppColors.accent,
      error: AppColors.accent,
      onError: AppColors.accent,
      onSecondary: AppColors.accent,
      onSurface: AppColors.accent,
      brightness: Brightness.light,
      surface: AppColors.accent,
    ),
  );

  ///Dark
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          size: 30,
          color: Colors.white,
        ),
        centerTitle: true,
        titleTextStyle: AppStyle.appBartextstyle),
    dividerTheme:
        const DividerThemeData(color: Color(0xFFF8CA1D), thickness: 5),
    iconTheme: const IconThemeData(
      size: 30,
      color: AppColors.accentDark,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFFF8CA1D),
        unselectedItemColor: Colors.white,
        backgroundColor: AppColors.primaryDark),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: AppColors.accentDark,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme: const ColorScheme(
      onPrimary: AppColors.accent,
      secondary: AppColors.accent,
      primary: AppColors.accent,
      error: AppColors.accent,
      onError: AppColors.accent,
      onSecondary: AppColors.accent,
      onSurface: AppColors.accent,
      brightness: Brightness.light,
      surface: AppColors.accent,
    ),
  );
}
