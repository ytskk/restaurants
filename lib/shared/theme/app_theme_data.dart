import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurants/constants/constants.dart';
import 'package:restaurants/shared/shared.dart';

class AppThemeData {
  const AppThemeData._();

  static ThemeData _themeData({
    Brightness brightness = Brightness.light,
    ColorScheme colorScheme = AppColorScheme.light,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: GoogleFonts.manropeTextTheme(
        const TextTheme(),
      ),
      scaffoldBackgroundColor: colorScheme.background,
      dividerTheme: const DividerThemeData(
        thickness: 1,
        indent: 16,
        endIndent: 16,
        color: Color(0xFFE0E6ED),
        space: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary.withOpacity(0.26);
              }

              return colorScheme.primary;
            },
          ),
          foregroundColor: MaterialStatePropertyAll(
            colorScheme.onPrimary,
          ),
          elevation: MaterialStateProperty.all(0.0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          minimumSize: const MaterialStatePropertyAll(
            Size.fromHeight(minButtonHeight),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0.0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onBackground,
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
        selectedLabelStyle: GoogleFonts.manrope(
          fontSize: 10.0,
          color: colorScheme.primary,
        ),
        unselectedLabelStyle: GoogleFonts.manrope(
          fontSize: 10.0,
          color: colorScheme.onBackground,
        ),
      ),
    );
  }

  static ThemeData get light => _themeData();

  static ThemeData get dark => _themeData(
        brightness: Brightness.dark,
        colorScheme: AppColorScheme.dark,
      );
}
