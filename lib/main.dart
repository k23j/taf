import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taf/home_screen.dart';
import 'package:taf/notifier/fab_notifier.dart';
import 'package:taf/participant/data/participant_group_list.dart';
import 'package:taf/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GroupNotifier(),),
        ChangeNotifierProvider(create: (context) => FABNotifier(),),
      ],
      child: const MainApp(),
    ),
  );
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
