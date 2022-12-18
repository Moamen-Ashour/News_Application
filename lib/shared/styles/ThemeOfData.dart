import 'package:flutter/material.dart';
import 'colors.dart';

class ThemeOfData {

  static ThemeData LightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        foregroundColor: COLOR_BLACK,
      ),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, color: COLOR_BLACK, fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: COLOR_GOLD,
          selectedItemColor: COLOR_BLACK,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed)

      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //    selectedItemColor: Colors.black,
      //     unselectedItemColor: Colors.white,
      //     // backgroundColor: colorGold,
      //   ),
      );

  static ThemeData DarkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0.0,
        foregroundColor: Colors.white,
      ));


}
