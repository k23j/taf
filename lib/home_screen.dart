import 'package:flutter/material.dart';
import 'package:taf/fab/custom_fab.dart';
import 'package:taf/fab/on_active_mixin.dart';
import 'package:taf/participant/view/participant_group_screen.dart';
import 'package:taf/participant/view/participant_screen.dart';
import 'package:taf/taf/view/taf_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static int currentScreenId = 0;

  List<GlobalKey<OnActiveMixin>> keyList = List.generate(3, (index) => GlobalKey<OnActiveMixin>());
  
  void changeScreen(int index) {
    setState(() {
      currentScreenId = index;
    });

    keyList[index].currentState!.onBecomeActive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentScreenId,
        children: [
          TAFScreen(key: keyList[0]),
          ParticipantGroupScreen(key: keyList[1]),
          ParticipantScreen(key: keyList[2]),
        ],
      ),
      floatingActionButton: const CustomFAB(),
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
