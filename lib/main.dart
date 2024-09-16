import 'package:flutter/material.dart';
import 'package:taf/home_screen.dart';
import 'package:taf/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      darkTheme: customThemeDark,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
