import 'package:flutter/material.dart';

const Color seedColor = Color.fromRGBO(13, 71, 161, 1);

ThemeData customTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
  useMaterial3: true, // optional, for Material 3 design
);

ThemeData customThemeDark = ThemeData(
  colorScheme:
      ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.dark),
);
