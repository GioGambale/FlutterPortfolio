import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/constants.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(7, 17, 26, 1),
    colorScheme: const ColorScheme.dark(),
    primarySwatch: Colors.yellow,
    primaryColor: const Color(0xFFFFD800),
    iconTheme: IconThemeData(color: Colors.grey[400]),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
  );
}
