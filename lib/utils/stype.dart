import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle fontStyles(double size, Color color, bool boldfont) {
  return GoogleFonts.chakraPetch(
    color: color == null ? Colors.black : Colors.redAccent,
    fontSize: size == null ? 16 : size,
    fontWeight: boldfont == false ? null : FontWeight.bold,
  );
}
