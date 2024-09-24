import 'package:flutter/material.dart';
import 'package:taf/notifier/dynamic_fab/dynamic_fab_data.dart';
import 'package:taf/notifier/dynamic_fab/fab_mixin.dart';

// bool fabTafState = false;
// ValueNotifier<bool> fabStateNotifier = ValueNotifier<bool>(fabTafState);

// void setFabTafState(bool b) {
//   fabTafState = b;
//   fabStateNotifier.value = fabTafState;
// }

// ValueNotifier<IconData> fabIconNotifier =
//     ValueNotifier<IconData>(Icons.play_arrow);

class FABNotifier extends ChangeNotifier {
  // bool enabled = true;
  // IconData? icon;
  // VoidCallback? onPressed;

  DynamicFabData? data;

  void switchMixin(FABMixin mixin) {
    data = mixin.data;

    notifyListeners();
  }

  void fabPressed() {
    if (data != null) {
      data!.onPressed();
    }
  }
}
