import 'package:flutter/material.dart';
import 'package:taf/participant/view/participant_group_screen.dart';
import 'package:taf/participant/view/participant_screen.dart';
import 'package:taf/test/taf_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey tafScreenKey = GlobalKey();
  late Widget tafScreen;

  static int currentScreenId = 0;

  @override
  void initState() {
    tafScreen = TAFScreen(key: tafScreenKey);
    super.initState();
  }

  void changeScreen(int index) {
    setState(() {
      currentScreenId = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      // ),
      // body: <Widget>[],
      body: IndexedStack(
        index: currentScreenId,
        children: [
          tafScreen,
          const ParticipantGroupScreen(),
          const ParticipantScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreenId,
        onDestinationSelected: changeScreen,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.assignment_turned_in_outlined), label: 'TAF'),
          NavigationDestination(icon: Icon(Icons.groups), label: 'Turmas'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Militares'),
        ],
      ),
    );
  }
}
