import 'package:flutter/material.dart';
import 'package:taf/notifier/fab_notifier.dart';
import 'package:taf/test/sprint/view/sprint_tab.dart';

class TAFScreen extends StatefulWidget {
  final FABNotifier fabNotifier;

  const TAFScreen({required this.fabNotifier, super.key});

  @override
  State<TAFScreen> createState() => _TAFScreenState();
}

class _TAFScreenState extends State<TAFScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  late final TabController tabController;

  List<FABNotifier> fabNotifierList = List.generate(3, (_) => FABNotifier());

  void onChangeTab(int id) {
    tabController.animateTo(id);
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    widget.fabNotifier.addListener(onFabPressed);
    super.initState();
  }

  void onFabPressed() {
    fabNotifierList[tabController.index].fabPressed();
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
            onTap: onChangeTab,
            tabs: const [
              Tab(text: 'Corrida'),
              Tab(text: 'Natação'),
              Tab(text: 'Permanência'),
            ],
          ),
          Expanded(
              child: TabBarView(controller: tabController, children: [
            SprintTab(fabNotifier: fabNotifierList[0]),
            const Center(child: Text('Natação')),
            const Center(child: Text('Permanência')),
          ])),
        ],
      ),
    );
  }
}
