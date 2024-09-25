import 'package:flutter/material.dart';
import 'package:taf/fab/on_active_mixin.dart';
import 'package:taf/taf/buoyancy/view/buoyancy_tab.dart';
import 'package:taf/taf/sprint/view/sprint_tab.dart';
import 'package:taf/taf/swim/view/swim_tab.dart';

class TAFScreen extends StatefulWidget {
  const TAFScreen({super.key});

  @override
  State<TAFScreen> createState() => _TAFScreenState();
}

class _TAFScreenState extends State<TAFScreen>
    with
        AutomaticKeepAliveClientMixin,
        TickerProviderStateMixin,
        OnActiveMixin {
  @override
  bool get wantKeepAlive => true;

  late final TabController _tabController;
  int _currentTab = 0;

  List<GlobalKey<OnActiveMixin>> keyList =
      List.generate(3, (index) => GlobalKey<OnActiveMixin>());

  void onChangeTab(int id) async {
    if (id != _currentTab) {
      //print('${keyList[id].currentState == null ? 'null' : 'valid'}');
      await Future.delayed(Duration.zero);
      keyList[id].currentState?.onBecomeActive();
      _currentTab = id;
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    //Call onBecameActive on child tabs
    _tabController.animation!.addListener(
      () => onChangeTab(_tabController.animation!.value.round()),
    );

    //Call the default active fab
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
        keyList[_tabController.index].currentState!.onBecomeActive());

    super.initState();
  }

  @override
  void onBecomeActive() {
    keyList[_tabController.index].currentState!.onBecomeActive();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TAF'),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: false,
            //onTap: onChangeTab,
            tabs: const [
              Tab(text: 'Corrida'),
              Tab(text: 'Natação'),
              Tab(text: 'Permanência'),
            ],
          ),
          Expanded(
              child: TabBarView(controller: _tabController, children: [
            SprintTab(key: keyList[0]),
            SwimTab(key: keyList[1]),
            BuoyancyTab(key: keyList[2]),
          ])),
        ],
      ),
    );
  }
}
