import 'package:flutter/material.dart';

abstract final class ThemeConstants {
  static final lightThemeData = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
  );

  static final darkThemeData = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}
