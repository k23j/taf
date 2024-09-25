import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taf/fab/fab_data.dart';
import 'package:taf/fab/on_active_mixin.dart';
import 'package:taf/notifier/fab_notifier.dart';

class BuoyancyTab extends StatefulWidget {
  const BuoyancyTab({
    super.key,
  });

  @override
  State<BuoyancyTab> createState() => _BuoyancyTabState();
}

class _BuoyancyTabState extends State<BuoyancyTab> with OnActiveMixin {
  late final FABData fabData;

  @override
  void initState() {
    fabData = FABData(icon: Icons.water, onPressed: onFabPressed);
    super.initState();
  }

  void onFabPressed() {}

  @override
  void onBecomeActive() {
    context.read<FABNotifier>().setData(fabData);
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Permanência'));
  }
}
