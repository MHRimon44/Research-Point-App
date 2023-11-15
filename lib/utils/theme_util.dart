import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeUtil {
  static const MaterialColor primaryColor = Colors.indigo;
  static const secondaryColor = Colors.indigoAccent;
  static const primaryTextColor = Color(0xFF3b2b28);

  static ThemeData defaultTheme() {
    return ThemeData(
      fontFamily: 'Poppins',
      primarySwatch: ThemeUtil.primaryColor,
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ThemeUtil.primaryColor,
      )),
      primaryColor: ThemeUtil.primaryColor,
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: ThemeUtil.primaryColor,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w900,
        ),
        titleLarge: TextStyle(
          color: ThemeUtil.primaryTextColor,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w900,
        ),
        titleMedium: TextStyle(
            color: ThemeUtil.primaryTextColor,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins'),
        titleSmall: TextStyle(
          color: ThemeUtil.primaryTextColor,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w200,
        ),
        bodySmall: TextStyle(
          color: ThemeUtil.primaryTextColor,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
