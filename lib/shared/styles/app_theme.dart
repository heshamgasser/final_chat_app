import 'package:final_chat_app/shared/styles/app_color.dart';
import 'package:final_chat_app/shared/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgrounColor,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(size: 30.r, color: Colors.white),
    ),
    textTheme: TextTheme(
      titleLarge: AppText.titleLarge,
      bodyLarge: AppText.bodyLarge,
      bodyMedium: AppText.bodyMedium,
      labelMedium: AppText.labelMedium,
    ),
  );
}
