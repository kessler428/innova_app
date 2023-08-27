import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  static const Color primaryColor = Color(0xFF00879D);
  static const Color secondaryColor = Color(0xFFBE2A1F);
  static const Color tertiaryColor = Color(0xFFFFCCC8);
  static const Color _backgroundColor = Color(0xFFF8F8F8);
  static const Color _errorColor = Color(0xFFEC6B6C);
  // ignore: unused_field
  static const Color _shadowColor = Color.fromARGB(255, 129, 126, 126);

  /// Returns the light theme for the app.
  ThemeData getLightTheme() => ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: _backgroundColor,
    useMaterial3: true,

    textTheme: GoogleFonts.aBeeZeeTextTheme( ThemeData.light().textTheme ),
    inputDecorationTheme: _inputDecotarionTheme(),

  );

  /// Returns the input decoration theme for the app.
  InputDecorationTheme _inputDecotarionTheme() {
    return InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: const Color.fromARGB(255, 205, 247, 251),
      focusColor: Colors.white,
      errorMaxLines: 4,
      enabledBorder: _buildBorder(Colors.transparent, 1),
      focusedBorder: _buildBorder(primaryColor, 1.0),
      focusedErrorBorder: _buildBorder(_errorColor, 1.5),
      errorBorder: _buildBorder(_errorColor, 1.5),
    );
  }

  /// Builds an outline border.
  InputBorder _buildBorder(Color color, double width){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color, 
        width: width
      )
    );
  }
  
}