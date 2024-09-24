import 'package:flutter/material.dart';
import 'package:taf/notifier/dynamic_fab/dynamic_fab_data.dart';
import 'package:taf/notifier/dynamic_fab/fab_mixin.dart';

class SwimTab extends StatefulWidget {
  const SwimTab({
    super.key,
  });

  @override
  State<SwimTab> createState() => SwimTabState();
}

class SwimTabState extends State<SwimTab> with FABMixin {
  @override
  void initState() {
    initFabMixin(DynamicFabData(icon: Icons.wysiwyg));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Natação'));
  }
}
