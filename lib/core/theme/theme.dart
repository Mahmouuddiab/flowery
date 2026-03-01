
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_font_styles.dart';
import 'package:flower_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppThemes {

  static final lightMode = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(primary: AppColors.primary),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
    ),
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
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: AppSize.s22,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      titleMedium: TextStyle(
        fontSize: AppSize.s16,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      titleSmall: TextStyle(
        fontSize: AppSize.s16,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
        height: AppSize.s1_2,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppColors.black,
      hintStyle: AppFontStyles.w400_12,
      labelStyle: AppFontStyles.w400_12,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.red),
      ),
      contentPadding: const EdgeInsets.only(left: 20),
      filled: true,
      fillColor: AppColors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),
  );
}
