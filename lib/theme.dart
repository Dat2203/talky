import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData darkTheme = ThemeData(
    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),
    ),
    primaryColorLight: Color.fromRGBO(51, 51, 51, 1),
    shadowColor: Colors.grey.shade900,
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
     backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    primaryColor: Color.fromARGB(200, 174, 242, 135),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
    iconTheme: IconThemeData(
        size: 20
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.grey),
    ),
  );

  static ThemeData lightTheme = ThemeData(

      textTheme: TextTheme(
        bodyMedium: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),
      ),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      primaryColorLight: Color.fromRGBO(51, 51, 51, 1),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      iconTheme: IconThemeData(
        size: 20
      ),
      primaryColor: Color.fromARGB(255, 174, 242, 135),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.grey),
      ));
}
