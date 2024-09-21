import 'package:flutter/material.dart';
import 'package:taf/notifier/fab_notifier.dart';
import 'package:taf/participant/view/participant_group_screen.dart';
import 'package:taf/participant/view/participant_screen.dart';
import 'package:taf/test/view/taf_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static int currentScreenId = 0;
  List<FABNotifier> fabNotifierList = List.generate(3, (_) => FABNotifier());

  void changeScreen(int index) {
    setState(() {
      currentScreenId = index;
    });

    if (index == 0) {
      fabStateNotifier.value = fabTafState;
      //Swim Material Icons
      // fabIconNotifier.value = Icons.pool;
      //Swim Awesome Fonts
      //https://fontawesome.com/icons/person-swimming?f=classic&s=solid
      //Buoyance Material Icons
      // fabIconNotifier.value = Icons.water;
      //Buoyance Awesome Fonts
      //https://fontawesome.com/icons/water?f=classic&s=solid
      //https://fontawesome.com/icons/water-ladder?f=classic&s=solid
      //Sprint Material Icons
      // fabIconNotifier.value = Icons.directions_run;
      //Sprint Awesome Fonts
      //https://fontawesome.com/icons/person-running?f=classic&s=solid
      //Generic
      fabIconNotifier.value = Icons.sports;
    } else {
      fabStateNotifier.value = true;
      fabIconNotifier.value = Icons.add;
    }
  }

  void onFabPressed() {
    fabNotifierList[currentScreenId].fabPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentScreenId,
        children: [
          TAFScreen(fabNotifier: fabNotifierList[0]),
          ParticipantGroupScreen(fabNotifier: fabNotifierList[1]),
          ParticipantScreen(fabNotifier: fabNotifierList[2]),
        ],
      ),
      floatingActionButton: ListenableBuilder(
        listenable: fabStateNotifier,
        builder: (context, child) => fabStateNotifier.value
            ? FloatingActionButton(
                onPressed: onFabPressed,
                child: child,
              )
            : const SizedBox.shrink(),
        child: ListenableBuilder(
            listenable: fabIconNotifier,
            builder: (context, child) => Icon(fabIconNotifier.value)),
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
