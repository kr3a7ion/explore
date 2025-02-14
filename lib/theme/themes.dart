import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryTextTheme: TextTheme(titleSmall: TextStyle(color: Colors.black)),
  primaryIconTheme: IconThemeData(color: Colors.black),
  primaryColorDark: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.black),
  ),
  iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.black))),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.black),
      backgroundColor: Colors.white,
      foregroundColor: Colors.white),
);


final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white))),
  iconTheme: IconThemeData(color: Colors.white),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.white),
  ),
  scaffoldBackgroundColor: Color(0xff05161A),
  appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff05161A), foregroundColor: Colors.white),
  
);

class AppColors {
  static const Color darkmodeBackgroundColorlighter =
      Color.fromARGB(31, 167, 167, 167);
}
