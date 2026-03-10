import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_font_styles.dart';
import 'package:flower_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  static final darkMode = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    cardColor: AppColors.black,
    colorScheme: const ColorScheme.dark(primary: AppColors.white),
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.primary),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.black,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.white,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      elevation: AppSize.s0,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: AppSize.s20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: AppColors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: AppSize.s18,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      titleMedium: TextStyle(
        fontSize: AppSize.s16,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      titleSmall: TextStyle(
        fontSize: AppSize.s14,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
        height: AppSize.s1_2,
      ),
      bodySmall: TextStyle(
        fontSize: AppSize.s16,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
        decoration: TextDecoration.lineThrough,
      ),
      labelMedium: TextStyle(
        fontSize: AppSize.s16,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      labelSmall: TextStyle(
        fontSize: AppSize.s16,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppColors.black,
      hintStyle: AppFontStyles.w400_12,
      labelStyle: AppFontStyles.w400_12,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.white),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.red),
      ),
      contentPadding: const EdgeInsets.only(left: 20),
      filled: true,
      fillColor: Colors.grey.shade300,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),
  );

  static final lightMode = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(primary: AppColors.primary),
    cardColor: Colors.white,
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.primary),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.gray,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: AppSize.s0,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: AppSize.s20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: AppColors.black),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: AppSize.s18,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      titleMedium: TextStyle(
        fontSize: AppSize.s16,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      titleSmall: TextStyle(
        fontSize: AppSize.s14,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
        height: AppSize.s1_2,
      ),
      bodySmall: TextStyle(
        fontSize: AppSize.s16,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        decoration: TextDecoration.lineThrough,
      ),
      labelMedium: TextStyle(
        fontSize: AppSize.s16,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      labelSmall: TextStyle(
        fontSize: AppSize.s16,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppColors.black,
      hintStyle: AppFontStyles.w400_12,
      labelStyle: AppFontStyles.w400_12,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.gray),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.gray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.black),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.red),
      ),
      contentPadding: const EdgeInsets.only(left: 20),
      filled: true,
      fillColor: Colors.grey.shade300,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),
  );
}
