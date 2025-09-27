// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

import '../main.dart';

class AppThemes {
  BuildContext context;

  static ColorScheme get colorContext =>
      Theme.of(navigatorKey.currentContext!).colorScheme;
  static TextTheme get textThemeContext =>
      Theme.of(navigatorKey.currentContext!).textTheme;

  AppThemes(this.context);

  // static initializeThemes() {
  //   colorContext = Theme.of(navigatorKey.currentContext!).colorScheme;
  //   textThemeContext = Theme.of(navigatorKey.currentContext!).textTheme;
  // }

  ThemeData defaultTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,

      fontFamily: 'Lato',
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        centerTitle: true,

        foregroundColor: AppColors.secondaryColor,
        titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),

      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   backgroundColor: Colors.black,
      // ),
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryColor,
        onPrimary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        onSecondary: AppColors.secondaryColor,
        primaryContainer: AppColors.secondaryColor,

        tertiaryContainer: const Color.fromARGB(255, 88, 97, 136),
        error: Colors.red,
        onError: Colors.white,
        onTertiaryContainer: Colors.grey,
        surface: AppColors.secondaryBackground,
        onSurface: Colors.black,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
        ),
        titleMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: 'Lato',
        ),
        bodyLarge: TextStyle(fontSize: 20, fontFamily: 'Lato'),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
          letterSpacing: 1,
        ),
        bodySmall: TextStyle(fontSize: 15, fontFamily: 'Lato'),
        labelLarge: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: 'Lato',
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          fontFamily: 'Lato',
        ),
      ),
    );
  }
}
