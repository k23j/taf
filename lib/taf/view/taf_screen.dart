import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:taf/notifier/dynamic_fab/dynamic_fab_data.dart';
import 'package:taf/notifier/dynamic_fab/fab_mixin.dart';
import 'package:taf/notifier/dynamic_fab/fab_notifier.dart';
import 'package:taf/taf/buoyancy/view/buoyancy_tab.dart';
import 'package:taf/taf/sprint/view/sprint_tab.dart';
import 'package:taf/taf/swim/view/swim_tab.dart';

class TAFScreen extends StatefulWidget {
  const TAFScreen({super.key});

  @override
  State<TAFScreen> createState() => TAFScreenState();
}

class TAFScreenState extends State<TAFScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin, FABMixin {
  @override
  bool get wantKeepAlive => true;

  GlobalKey<SprintTabState> sprintKey = GlobalKey<SprintTabState>();
  GlobalKey<SwimTabState> swimKey = GlobalKey<SwimTabState>();
  GlobalKey<BuoyancyTabState> buoyancyKey = GlobalKey<BuoyancyTabState>();

  late List<GlobalKey<FABMixin>> keyList;

  @override
  void onFabPressed() {
    print('testInsideTAF');
    super.onFabPressed();
  }

  late final TabController tabController;

  void onChangeTab(int id) async {
    print('changeTo$id');
    tabController.animateTo(id);
    notifyFab();
  }

  @override
  void notifyFab([FABMixin<StatefulWidget>? mixin]) {
    super.notifyFab(keyList[tabController.index].currentState);
  }

  @override
  void initState() {
    keyList = [sprintKey, swimKey, buoyancyKey];
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(
      () => onChangeTab(tabController.index),
    );
    //initFabMixin(DynamicFabData(isDefault: true, icon: Icons.directions_run));

    //WidgetsBinding.instance.addPostFrameCallback((timeStamp) => notifyFab(),);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
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
            controller: tabController,
            isScrollable: false,
            //onTap: onChangeTab,
            tabs: const [
              Tab(text: 'Corrida'),
              Tab(text: 'Natação'),
              Tab(text: 'Permanência'),
            ],
          ),
          Expanded(
              child: TabBarView(controller: tabController, children: [
            SprintTab(key: sprintKey),
            SwimTab(key: swimKey),
            BuoyancyTab(key: buoyancyKey),
          ])),
        ],
      ),
    );
  }
}
