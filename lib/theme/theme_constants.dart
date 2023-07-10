import 'package:flutter/material.dart';

abstract final class ThemeConstants {
  static const textTheme = TextTheme();

  static final lightThemeData = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: const Color(0xFFFBFBFB),
    textTheme: textTheme,
    colorScheme: const ColorScheme(
      primary: Color(0xFFFBFBFB),
      secondary: Color(0xFFE0E0E0),
      background: Color(0xFFFBFBFB),
      error: Color(0xFFB00020),
      surface: Color(0xFFE0E0E0),
      onPrimary: Color(0xFF262626),
      onSecondary: Color(0xFF262626),
      onSurface: Color(0xFF262626),
      onBackground: Color(0xFF262626),
      onError: Color(0xFFFBFBFB),
      brightness: Brightness.light,
      onTertiary: Color(0xFF007aff),
    ),
  );

  static final darkThemeData = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: const Color(0xFF262626),
    textTheme: textTheme,
    colorScheme: const ColorScheme(
      primary: Color(0xFF262626),
      secondary: Color(0xFF363636),
      background: Color(0xFF262626),
      error: Color(0xFFB00020),
      surface: Color(0xFF363636),
      onPrimary: Color(0xFFFBFBFB),
      onSecondary: Color(0xFFFBFBFB),
      onSurface: Color(0xFFFBFBFB),
      onBackground: Color(0xFFFBFBFB),
      onError: Color(0xFFFBFBFB),
      brightness: Brightness.dark,
      onTertiary: Color(0xFF007aff),
    ),
  );
}
