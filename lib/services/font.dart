import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Font {
  static TextStyle regular({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.righteous(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
