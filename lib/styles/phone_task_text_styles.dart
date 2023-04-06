import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneTaskTextStyles {
  static TextStyle titleTextWhite = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: Colors.white
  );

  static TextStyle commonTextWhite = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white
  );

  static TextStyle commonTextBlack = GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: const Color.fromRGBO(89, 76, 116, 1),
  );

  static TextStyle commonTextHint = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: const Color.fromRGBO(120, 134, 184, 1),
  );
}
