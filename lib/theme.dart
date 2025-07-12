import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.purple,
  scaffoldBackgroundColor: Colors.grey[200],
  cardColor: Colors.grey[300],
  focusColor: Colors.white,
  canvasColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.purple,
    foregroundColor: Colors.white,
  ),
);

final dartkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.purple,
  scaffoldBackgroundColor: const Color.fromARGB(255, 34, 34, 34),
  cardColor: Colors.grey[700],
  focusColor: const Color.fromARGB(255, 34, 34, 34),
  canvasColor: Colors.grey[800],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900],
    foregroundColor: Colors.white,
  ),
);
