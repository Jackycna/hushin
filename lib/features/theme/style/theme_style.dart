import 'package:flutter/material.dart';
import 'package:hushin/core/colors/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primarycolor,
    scaffoldBackgroundColor: AppColors.whitecolor,
    brightness: Brightness.light,
    textTheme: TextTheme(bodyLarge: TextStyle(color: AppColors.blackcolor)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primarycolor,
        textStyle: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );
  static final darkTheme = ThemeData(
    primaryColor: AppColors.primarycolor,
    scaffoldBackgroundColor: AppColors.blackcolor,
    brightness: Brightness.dark,
    textTheme: TextTheme(bodyLarge: TextStyle(color: AppColors.blackcolor)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primarycolor,
        textStyle: TextStyle(
          fontSize: 20,
          color: AppColors.whitecolor,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );
}
