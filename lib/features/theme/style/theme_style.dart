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
        foregroundColor: AppColors.whitecolor,
        textStyle: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.primarycolor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.primarycolor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.primarycolor),
      ),
      labelStyle: TextStyle(color: AppColors.primarycolor),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.primarycolor),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.primarycolor,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(AppColors.whitecolor),
        backgroundColor: WidgetStatePropertyAll(AppColors.primarycolor),
        foregroundColor: WidgetStatePropertyAll(AppColors.whitecolor),
      ),
    ),
  );
  static final darkTheme = ThemeData(
    primaryColor: AppColors.primarycolor,
    scaffoldBackgroundColor: AppColors.blackcolor,
    brightness: Brightness.dark,
    textTheme: TextTheme(bodyLarge: TextStyle(color: AppColors.whitecolor)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primarycolor,
        foregroundColor: AppColors.blackcolor,
        textStyle: TextStyle(
          fontSize: 20,
          color: AppColors.blackcolor,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.primarycolor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.primarycolor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.primarycolor),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.primarycolor),
      ),
      labelStyle: TextStyle(color: AppColors.primarycolor),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.primarycolor,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(AppColors.blackcolor),
        backgroundColor: WidgetStatePropertyAll(AppColors.primarycolor),
        foregroundColor: WidgetStatePropertyAll(AppColors.blackcolor),
      ),
    ),
  );
}
