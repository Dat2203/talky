import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData darkTheme = ThemeData(
    textTheme: GoogleFonts.robotoTextTheme(

    ),
    shadowColor: Colors.grey.shade900,
    brightness: Brightness.dark,
    backgroundColor: Color.fromARGB(255, 37, 36, 36),
    scaffoldBackgroundColor: Color.fromARGB(255, 37, 36, 36),
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
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.grey),
    ),
  );

  static ThemeData lightTheme = ThemeData(
      textTheme: GoogleFonts.robotoTextTheme(
      ),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      // appBarTheme: AppBarTheme(
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(20),
      //     bottomRight: Radius.circular(20),
      //   )),
      //   color: Color.fromARGB(255, 174, 242, 135),
      //   elevation: 0,
      //   foregroundColor: Colors.black,
      // ),
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
