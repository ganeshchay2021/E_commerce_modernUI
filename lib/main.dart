// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce_modernui/utils/app_theme.dart';
import 'package:e_commerce_modernui/utils/cubit/theme_cubit.dart';
import 'package:e_commerce_modernui/view/splash/splash_screen.dart';

void main() async {
  runApp(BlocProvider(
    create: (_) => ThemeCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Fashion Store',
          debugShowCheckedModeBanner: false,
          theme: state is LightThemeState ? AppTheme.light : AppTheme.dark,
          themeAnimationCurve: Curves.linear,
          themeAnimationDuration: const Duration(milliseconds: 500),
          home: const SplashScreen(),
        );
      },
    );
  }
}
