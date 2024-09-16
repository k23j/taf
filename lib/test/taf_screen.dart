import 'package:flutter/material.dart';

class TAFScreen extends StatefulWidget {
  const TAFScreen({super.key});

  @override
  State<TAFScreen> createState() => _TAFScreenState();
}

class _TAFScreenState extends State<TAFScreen> with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  late final TabController tabController;

  void onChangeTab(int id) {
    tabController.animateTo(id);
  }

  @override
  void initState() {
    print('TAF Screen key: ${widget.key} -----------------------------');
    tabController = TabController(length: 3, vsync: this);
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
            onTap: onChangeTab,
            tabs: const [
              Tab(text: 'Corrida'),
              Tab(text: 'Natação'),
              Tab(text: 'Permanência'),
            ],
          ),
          Expanded(
              child: TabBarView(controller: tabController, children: const [
            Center(child: Text('Corrida')),
            Center(child: Text('Natação')),
            Center(child: Text('Permanência')),
          ])),
        ],
      ),
    );
  }
}
