import 'package:flutter/material.dart';
import 'package:taf/notifier/dynamic_fab/dynamic_fab_data.dart';
import 'package:taf/notifier/dynamic_fab/fab_mixin.dart';

class BuoyancyTab extends StatefulWidget {
  const BuoyancyTab({
    super.key,
  });

  @override
  State<BuoyancyTab> createState() => BuoyancyTabState();
}

class BuoyancyTabState extends State<BuoyancyTab> with FABMixin {
  @override
  void initState() {
    initFabMixin(DynamicFabData(icon: Icons.zoom_out_map));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Permanência'));
  }
}
