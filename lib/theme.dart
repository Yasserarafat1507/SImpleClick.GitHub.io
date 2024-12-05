import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';

ThemeData themeData(bool isDarkMode) {
  return ThemeData(
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor:
        isDarkMode ? const Color.fromARGB(255, 44, 54, 75) : Colors.white,
    cardColor: isDarkMode ? Colors.grey[900] : Color(0xfff5f6f9),
    iconTheme: IconThemeData(
      color: isDarkMode ? Colors.white : Colors.black,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: isDarkMode ? Colors.white : Colors.black,
      ),
    ),
    inputDecorationTheme: inputDecoretionTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    titleMedium: TextStyle(color: kTextColor),
    bodyMedium: TextStyle(color: kTextColor),
  );
}

InputDecorationTheme inputDecoretionTheme() {
  var outlineInputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(28)),
    borderSide: BorderSide(color: kPrimaryColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 42,
      vertical: 20,
    ),
    labelStyle: TextStyle(color: kPrimaryColor),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}
