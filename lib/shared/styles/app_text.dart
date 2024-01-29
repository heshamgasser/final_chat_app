import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppText {
  static TextStyle titleLarge = GoogleFonts.pacifico(
      fontSize: 30.sp, fontWeight: FontWeight.bold, color: Colors.white);

  // static TextStyle titleMedium = GoogleFonts. ;
  // static TextStyle titleSmall = GoogleFonts. ;

  // static TextStyle displayLarge = ;
  // static TextStyle displayMedium = GoogleFonts. ;
  // static TextStyle displaySmall = GoogleFonts. ;

  static TextStyle bodyLarge = GoogleFonts.poppins(
      fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.bold);
  static TextStyle bodyMedium =
      GoogleFonts.poppins(fontSize: 16.sp, color: AppColors.backgrounColor);

// static TextStyle bodySmall = GoogleFonts. ;
//
// static TextStyle labelLarge = GoogleFonts. ;
  static TextStyle labelMedium =
      GoogleFonts.poppins(fontSize: 16.sp, color: Colors.white);
// static TextStyle labelSmall = GoogleFonts. ;
//
// static TextStyle headlineLarge = GoogleFonts. ;
// static TextStyle headlineMedium = GoogleFonts. ;
// static TextStyle headlineSmall = GoogleFonts. ;
}
