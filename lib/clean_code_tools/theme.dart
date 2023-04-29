import 'package:flutter/material.dart';
import 'package:newproject/clean_code_tools/clean_code_tools.dart';

final ThemeData myAppThemeData = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: mainColorOfButtons,
    ),
  ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
  ),
);
