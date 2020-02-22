import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text textFix(String label, double size, Color color, bool boldfont) {
  return Text(label,
      style: GoogleFonts.chakraPetch(
        fontSize: size == null ? 20.00 : size,
        color: color == null ? Colors.black : color,
        fontWeight: boldfont == false ? null : FontWeight.w500,
      ));
}
