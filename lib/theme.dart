import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData darkThemeData = ThemeData(
      colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    background: Color(0xFFB70404),
    primary: Color(0xFFDB005B),
    secondary: Color(0xFFF79327),
    tertiary: Color(0xFFFFE569), 
    error: Colors.red,
    onError: Colors.red,
    onBackground: Colors.black,
    surface: Color(0xFF393E46),
    onSurface: Colors.white,
    onPrimary: Colors.black54,
    onSecondary: Colors.black45,
  ));
}
