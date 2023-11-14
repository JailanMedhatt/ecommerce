import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryBlue= Color(0xff004182);
  static Color white= Colors.white;

  static ThemeData mainTheme= ThemeData(
    textTheme: TextTheme(
      titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color:white
      ),

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryBlue,
     elevation: 0
    )
  );

}