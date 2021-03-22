import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/theme/color/dark_color.dart';

import 'color/lightColor.dart';

class AppTheme {
  const AppTheme();
  static ThemeData darkTheme = ThemeData(
    primarySwatch: createMaterialColor(LightColor.primary),
    backgroundColor: LightColor.background,
    accentColor: DarkColor.lightblack,
    primaryColor: LightColor.primary,
    primaryColorDark: LightColor.primaryDark,
    primaryColorLight: LightColor.primaryLight,
    textSelectionColor: DarkColor.white,
    cardTheme: CardTheme(color: DarkColor.background),
    textTheme: TextTheme(body1: TextStyle(color: DarkColor.black)),
    appBarTheme: AppBarTheme(backgroundColor: LightColor.primaryDark),
    iconTheme: IconThemeData(color: LightColor.secondary),
    bottomAppBarColor: LightColor.primaryDark,
    dividerColor: LightColor.subTitleTextColor,
    colorScheme: ColorScheme(
        primary: LightColor.primary,
        primaryVariant: LightColor.primaryDark,
        secondary: LightColor.secondary,
        secondaryVariant: LightColor.secondary,
        surface: DarkColor.white,
        background: DarkColor.background,
        error: Colors.red,
        onPrimary: DarkColor.Brighter,
        onSecondary: DarkColor.Darker,
        onSurface: DarkColor.black,
        onBackground: DarkColor.titleTextColor,
        onError: DarkColor.titleTextColor,
        brightness: Brightness.dark),
  );

  static TextStyle titleStyle =
      const TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
      const TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);
}
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red,
      g = color.green,
      b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
