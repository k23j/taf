import 'package:flutter/material.dart';

ColorScheme customColorSchemeLight =
    ColorScheme.fromSeed(seedColor: Colors.teal[900]!);

ColorScheme customColorSchemeDark = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Colors.teal[900]!);

ThemeData customLightTheme =
    ThemeData.light().copyWith(colorScheme: customColorSchemeLight);
ThemeData customDarkTheme =
    ThemeData.dark().copyWith(colorScheme: customColorSchemeDark);

// ThemeData customTheme = ThemeData.from(
//     colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan[900]!));

//ThemeData customThemeDark = ThemeData.dark();// ThemeData.dark().copyWith(colorScheme: customColorSchemeLight);
