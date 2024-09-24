import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taf/notifier/dynamic_fab/fab_notifier.dart';

class DynamicFab extends StatelessWidget {
  const DynamicFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FABNotifier>(
        builder: (context, value, child) => (value.data != null && value.data!.enabled)
            ? FloatingActionButton(
                onPressed: value.fabPressed,
                child: Icon(value.data!.icon ?? Icons.abc),
              )
            : const SizedBox.shrink());
  }
}
