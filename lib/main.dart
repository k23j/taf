import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taf/home_screen.dart';
import 'package:taf/notifier/dynamic_fab/fab_notifier.dart';
import 'package:taf/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => FABNotifier(),
  child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customLightTheme,
      darkTheme: customDarkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
