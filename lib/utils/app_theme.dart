import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  //color theme for light mode
  static final light = ThemeData(
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFff5722),
        primary: const Color(0xFFff5722),
        brightness: Brightness.light,
        surface: Colors.white),
    cardColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: const IconThemeData(size: 25,
      color: Color(0xFFff5722)),
      backgroundColor: Colors.white,
      elevation: 5,
      selectedLabelStyle: AppTextstyles.buttonMedium,
      selectedItemColor: const Color(0xFFff5722),
      unselectedItemColor: Colors.grey,
    ),
  );

  //color theme for dark mode
  static final dark = ThemeData(
    primaryColor: Colors.red,
    scaffoldBackgroundColor: const Color(0xFF121212),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121212),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFff5722),
        primary: const Color(0xFFff5722),
        brightness: Brightness.dark,
        surface: const Color(0xFF121212)),
    cardColor: const Color(0xFF1E1E1E),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: Color(0xFFff5722),
      unselectedItemColor: Colors.grey,
    ),
  );
}
