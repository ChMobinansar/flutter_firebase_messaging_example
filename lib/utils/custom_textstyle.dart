import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_colors.dart';

class CustomTextStyle {
  static TextStyle interText = GoogleFonts.inter(
    fontSize: 25,
    color: CustomColors.blackColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle larkenTextItalic = const TextStyle(
    fontFamily: 'Larken',
    fontSize: 24,
    fontStyle: FontStyle.italic,
  );

  static TextStyle larkenTextRegular = const TextStyle(
    fontFamily: 'Larken',
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static TextStyle coolWonderText = const TextStyle(
    fontFamily: 'Coolwonder',
    fontSize: 24,
  );
}
