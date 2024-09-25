import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taf/fab/fab_data.dart';
import 'package:taf/fab/on_active_mixin.dart';
import 'package:taf/notifier/fab_notifier.dart';

class SwimTab extends StatefulWidget {
  const SwimTab({
    super.key,
  });
  @override
  State<SwimTab> createState() => _SwimTabState();
}

class _SwimTabState extends State<SwimTab> with OnActiveMixin {
  late final FABData fabData;

  @override
  void initState() {
    fabData = FABData(icon: Icons.pool, onPressed: onFabPressed);
    super.initState();
  }

  void onFabPressed() {
    
  }

  @override
  void onBecomeActive() {
    context.read<FABNotifier>().setData(fabData);
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Natação'));
  }
}
