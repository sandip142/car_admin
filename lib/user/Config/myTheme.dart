
import 'package:car_admin/user/Config/Colors.dart';
import 'package:flutter/material.dart';

var lightTheme = ThemeData(
    useMaterial3: true,
  appBarTheme: const AppBarTheme(
      backgroundColor: lightPrimaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: lightFontColor,
      ),
      titleTextStyle: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        color: lightFontColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: lightBgColor,
      filled: true,
      enabledBorder: InputBorder.none,
      prefixIconColor: lightLableColor,
      labelStyle: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        color: lightFontColor,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        color: lightFontColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      background: lightBgColor,
      onBackground: lightFontColor,
      primaryContainer: lightDivColor,
      onPrimaryContainer: lightFontColor,
      secondaryContainer: lightLableColor,
      primary: lightPrimaryColor,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 24,
        color: lightFontColor,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        color: lightFontColor,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        color: lightFontColor,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        color: lightFontColor,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        color: lightFontColor,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 13,
        color: lightFontColor,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 13,
        color: lightLableColor,
        fontWeight: FontWeight.w300,
      ),
    ));
var darkTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkDivColor,
      foregroundColor: darkFontColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: darkFontColor,
      ),
      titleTextStyle: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        color: darkFontColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      background: darkBgColor,
      onBackground: darkFontColor,
      primaryContainer: darkDivColor,
      onPrimaryContainer: darkFontColor,
      secondaryContainer: darkLableColor,
      primary: darkPrimaryColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: darkBgColor,
      filled: true,
      enabledBorder: InputBorder.none,
      prefixIconColor: darkLableColor,
      labelStyle: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        color: darkFontColor,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        color: darkFontColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 24,
        color: darkFontColor,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        color: darkFontColor,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        color: darkFontColor,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        color: darkFontColor,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        color: darkFontColor,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 13,
        color: darkFontColor,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 13,
        color: darkLableColor,
        fontWeight: FontWeight.w300,
      ),
    ));
