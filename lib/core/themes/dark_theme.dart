import 'package:flutter/material.dart';

class AppDarkThemeData {
  static ThemeData appDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.redAccent,
      hintColor: Colors.orange,
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.redAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.redAccent,
        textTheme: ButtonTextTheme.primary,
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
          .copyWith(surface: Colors.black),
    );
  }
}
