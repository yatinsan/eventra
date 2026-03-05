import 'package:events/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle titleText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle body = GoogleFonts.manrope(color: AppColors.gray500);
  static TextStyle bodyLarge = GoogleFonts.manrope(
    color: AppColors.gray600,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
}
