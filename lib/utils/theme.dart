import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ECommerceAppTheme {
  static const Color primaryColor = Color(0xFF0c54be);
  static const Color secondaryColor = Color(0xFF303f60);
  static const Color backgroundColor = Color(0xFFf5f9fd);
  static const Color accentColor = Color(0xFFced3dc);
  static const Color blackColor = Color(0xFF000000);
  static ThemeData get themeData {
    return ThemeData(
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          fontSize: 57.0,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 45.0,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: GoogleFonts.poppins(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: GoogleFonts.poppins(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
