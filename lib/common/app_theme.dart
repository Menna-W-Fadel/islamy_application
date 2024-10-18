import 'package:flutter/material.dart';
import 'package:islamy_application/common/app_colors.dart';

class AppTheme {
  //DARK THEME
  static ThemeData darkTheme = ThemeData(

      dividerTheme: DividerThemeData(color: AppColors.paleWhite),
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.mainColor,
          onPrimary: AppColors.darkSecondaryColor,
          secondary: AppColors.secondaryColor,
          onSecondary: AppColors.secondaryColor,
          error: Colors.red,
          onError: Colors.white,
          background: AppColors.paleWhite,
          onBackground: Colors.white,
          surface: AppColors.mainColor,
          onSurface: AppColors.starsColor),
      canvasColor: AppColors.mainColor,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: AppColors.mainColor,
        selectedItemColor: AppColors.secondaryColor,
        unselectedItemColor: Colors.white,
      ),
      textTheme: TextTheme(
        titleSmall: TextStyle(
          fontFamily: "Amiri",
          height: 1.1,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.paleWhite,
        ),
        titleMedium: const TextStyle(
          fontFamily: "Amiri",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        titleLarge: TextStyle(
          fontFamily: "Amiri",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.secondaryColor,
        ),
        labelMedium: TextStyle(
          fontFamily: "Amiri",
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.paleWhite,
        ),
        bodyLarge: const TextStyle(
          fontFamily: "Amiri",
          fontSize: 18,
          height: 1.4,
          color: Colors.white,
        ),
      ));

  // LIGHT THEME
  static ThemeData lightTheme = ThemeData(
      dividerTheme: DividerThemeData(color: AppColors.starsColor),
      canvasColor: AppColors.mainColor,
      primaryColor: AppColors.mainColor,
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.mainColor,
          onPrimary: AppColors.lightSecondaryColor,
          secondary: AppColors.secondaryColor,
          onSecondary: AppColors.starsColor,
          error: Colors.red,
          onError: AppColors.mainColor,
          background: AppColors.greyColor,
          onBackground: AppColors.goldColor,
          surface: Colors.white,
          onSurface: AppColors.mainColor),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: AppColors.mainColor,
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: AppColors.mainColor,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.secondaryColor,
        unselectedItemColor: Colors.white,
      ),
      textTheme: TextTheme(
          titleSmall: TextStyle(
            fontFamily: "Amiri",
            height: 1.1,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.mainColor,
          ),
          titleMedium: TextStyle(
            fontFamily: "Amiri",
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.mainColor,
          ),
          titleLarge: TextStyle(
            fontFamily: "Amiri",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.mainColor,
          ),
          labelMedium: TextStyle(
            fontFamily: "Amiri",
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.mainColor,
          ),
          bodyLarge: TextStyle(
            height: 1.4,
            fontFamily: "Amiri",
            fontSize: 18,
            color: AppColors.mainColor,
          )));
}
