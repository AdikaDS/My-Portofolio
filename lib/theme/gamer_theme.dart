import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GamerColors {
  static const Color background = Color(0xFF0B0C10);
  static const Color surface = Color(0xFF151922);
  static const Color surfaceSecondary = Color(0xFF1F2833);
  static const Color accentCyan = Color(0xFF66FCF1);
  static const Color accentPurple = Color(0xFF8A2BE2);
  static const Color accentPink = Color(0xFFFF007F);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFC5C6C7);
  static const Color border = Color(0xFF45A29E);
  static const Color borderNeon = Color(0xFF66FCF1);
}

class GamerTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: GamerColors.background,
      colorScheme: const ColorScheme.dark(
        primary: GamerColors.accentCyan,
        secondary: GamerColors.accentPurple,
        tertiary: GamerColors.accentPink,
        surface: GamerColors.surface,
        onSurface: GamerColors.textPrimary,
      ),
      textTheme: GoogleFonts.orbitronTextTheme(
        ThemeData.dark().textTheme.copyWith(
          displayLarge: const TextStyle(
            color: GamerColors.textPrimary,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
          displayMedium: const TextStyle(
            color: GamerColors.textPrimary,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
          titleLarge: const TextStyle(
            color: GamerColors.accentCyan,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
          bodyLarge: const TextStyle(
            color: GamerColors.textSecondary,
            fontSize: 16.0,
            letterSpacing: 0.5,
          ),
          bodyMedium: const TextStyle(
            color: GamerColors.textSecondary,
            fontSize: 14.0,
            letterSpacing: 0.5,
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: GamerColors.accentCyan,
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(GamerColors.accentCyan.withOpacity(0.5)),
        trackColor: WidgetStateProperty.all(GamerColors.surface),
        thickness: WidgetStateProperty.all(6.0),
        radius: const Radius.circular(3),
      ),
    );
  }
}
