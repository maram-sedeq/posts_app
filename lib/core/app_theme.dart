import 'package:flutter/material.dart';

final primaryColor = Color.fromARGB(255, 244, 143, 177);
final secondaryColor = Color.fromARGB(255, 255, 255, 255);
final buttonsColor = Color.fromARGB(255, 203, 20, 109);
final errorColor = Color.fromARGB(255, 255, 79, 79);
final snackbarColor = Color.fromARGB(255, 244, 143, 177);

final appTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
    ),
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: primaryColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primaryColor),
        iconColor: secondaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: secondaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(8),
        )));
