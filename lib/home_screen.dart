import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taf/notifier/dynamic_fab/dynamic_fab.dart';
import 'package:taf/notifier/dynamic_fab/fab_mixin.dart';
import 'package:taf/notifier/dynamic_fab/fab_notifier.dart';
//import 'package:taf/participant/view/participant_group_screen.dart';
import 'package:taf/participant/view/participant_screen.dart';
import 'package:taf/taf/sprint/view/sprint_tab.dart';
import 'package:taf/taf/view/taf_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static int currentScreenId = 0;
  List<FABNotifier> fabNotifierList = List.generate(3, (_) => FABNotifier());

  GlobalKey<TAFScreenState> sprintKey = GlobalKey<TAFScreenState>();
  GlobalKey<ParticipantScreenState> participantKey =
      GlobalKey<ParticipantScreenState>();

  late List<GlobalKey<FABMixin>> keyList;

  @override
  void initState() {
    keyList = [sprintKey, participantKey];
    super.initState();
  }

  void changeScreen(int index) {
    setState(() {
      currentScreenId = index;
    });

    keyList[index].currentState!.notifyFab();
  }

  // void onFabPressed() {
  //   fabNotifierList[currentScreenId].fabPressed();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentScreenId,
        children: [
          TAFScreen(
            key: sprintKey,
          ),
          //ParticipantGroupScreen(fabNotifier: fabNotifierList[1]),
          ParticipantScreen(key: participantKey),
        ],
      ),
      floatingActionButton: DynamicFab(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreenId,
        onDestinationSelected: changeScreen,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.assignment_turned_in_outlined), label: 'TAF'),
          //NavigationDestination(icon: Icon(Icons.groups), label: 'Turmas'),
          NavigationDestination(icon: Icon(Icons.groups), label: 'Militares'),
        ],
      ),
    );
  }
}
