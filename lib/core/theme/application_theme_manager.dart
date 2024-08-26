import 'package:flutter/material.dart';

import 'color_palette.dart';

class ApplicationThemeManager {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: ColorPalette.primaryColor,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        color: ColorPalette.primaryColor),
    iconTheme: IconThemeData(color: Colors.white, size: 30),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontFamily: "Poppins",
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          ),
      titleLarge: TextStyle(
          fontFamily: "Exo",
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w400,
          height: 29.24),
      titleMedium: TextStyle(
          fontFamily: "Exo",
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          ),
    ),
  );
}
