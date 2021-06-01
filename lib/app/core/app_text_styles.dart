import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle heading = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle options = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle button = GoogleFonts.notoSans(
    color: AppColors.rosaFiap,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle warning = GoogleFonts.notoSans(
    color: Colors.red,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle body = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle presentes = GoogleFonts.notoSans(
    color: Colors.green,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle ausentes = GoogleFonts.notoSans(
    color: Colors.red,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle bodyBold = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  static TextStyle getStatusStyle(String status) {
    if (status.toLowerCase() == "publicado") {
      return GoogleFonts.notoSans(
        color: Colors.green,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      );
    }
    return GoogleFonts.notoSans(
      color: Colors.purpleAccent,
      fontSize: 18,
      fontWeight: FontWeight.normal,
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}