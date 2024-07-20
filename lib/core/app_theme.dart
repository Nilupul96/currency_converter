import 'package:currency_converter/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData appLightTheme = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: IconThemeData(color: AppColors.black),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: AppColors.white),
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))));
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.black,
      iconTheme: const IconThemeData(color: Colors.white),
      fontFamily: 'Montserrat',
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.black,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            fontFamily: 'Montserrat',
          )),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: AppColors.black),
      textTheme: TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.white,
            fontSize: 20.sp,
            fontFamily: 'Montserrat',
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.white,
            fontSize: 18.sp,
            fontFamily: 'Montserrat',
          ),
          displaySmall: TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColors.white,
            fontSize: 16.sp,
            fontFamily: 'Montserrat',
          )),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.grey,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.lightGreen)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.grey)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.grey)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.red)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.red))));

  static TextTheme textTheme() => TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 20.sp,
        fontFamily: 'Montserrat',
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        fontFamily: 'Montserrat',
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        fontFamily: 'Montserrat',
      ));

  static AppBarTheme appBarTheme() => AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.black,
          fontSize: 16.sp));
}
