import 'package:flutter/material.dart';


class UnspashTheme {
  static ThemeData theme = ThemeData(
    primaryColor: Color(0xFF3B2168),
    accentColor: Color(0xFF942E91),
    backgroundColor: Color(0xFFF5F6F6),
    scaffoldBackgroundColor: Color(0xFFF5F6F6),
    colorScheme: ColorScheme(
      primary: Color(0xFF000000),
      primaryVariant: Color(0xFF000000),
      secondary: Color(0xFF4BC287),
      secondaryVariant: Color(0xFF4BC287),
      background: Color(0xFFF5F6F6),
      surface: Color(0xFFF5F6F6),
      error: Color(0xFFF24E38),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF000000),
      onBackground: Color(0xFF000000),
      onError: Color(0xFFFFFFFF),
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      button: TextStyle(fontSize: 20),
      caption:  TextStyle(fontSize: 30)
    ),
  );
}