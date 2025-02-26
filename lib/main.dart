import 'package:e_commerce_modernui/utils/app_theme.dart';
import 'package:e_commerce_modernui/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion Store',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeAnimationCurve: Curves.linear,
      themeAnimationDuration: const Duration(milliseconds: 500),
      home: const SplashScreen(),
    );
  }
}
