import 'package:flutter/material.dart';

class AppDarkThemeData {
  static ThemeData appDarkTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.red,
      hintColor: Colors.orange,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.red,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.red,
        textTheme: ButtonTextTheme.primary,
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
          .copyWith(surface: Colors.white),
    );
  }
}
