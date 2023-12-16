import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      border: outlineInputBorder,
      errorBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      disabledBorder: outlineInputBorder,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            disabledBackgroundColor: Colors.grey,
            textStyle: TextStyle(
              fontSize: 18,
            ))));

OutlineInputBorder outlineInputBorder =
    OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));
