import 'package:flutter/material.dart';

class AppColorScheme {
  static const ColorScheme light = ColorScheme(
    primary: Color(0xFF4631D2),
    secondary: Color(0xFF1E88E5),
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFF2F2F2),
    primaryContainer: Color(0xFFFEFEFE),
    error: Color(0xFFB00020),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF000000),
    onBackground: Color(0xFF000000),
    onError: Color(0xFFFFFFFF),
    outline: Color(0xFFE0E6ED),
    brightness: Brightness.light,
  );

  static const ColorScheme dark = ColorScheme(
    primary: Color(0xFF8679E1),
    secondary: Color(0xFF1E88E5),
    surface: Color(0xFF121212),
    background: Color(0xFF000000),
    primaryContainer: Color(0xFF171717),
    error: Color(0xFFCF6679),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFFFFFFFF),
    onBackground: Color(0xFFFFFFFF),
    onError: Color(0xFF000000),
    brightness: Brightness.dark,
  );
}
