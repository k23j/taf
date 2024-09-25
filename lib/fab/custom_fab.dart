import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taf/notifier/fab_notifier.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FABNotifier>(
      builder: (context, value, child) => value.data != null ?
          FloatingActionButton(onPressed: value.data!.onPressed, child: Icon(value.data!.icon)) :
          const SizedBox.shrink()
    );
  }
}
