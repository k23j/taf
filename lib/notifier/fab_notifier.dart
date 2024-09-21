import 'package:flutter/material.dart';

bool fabTafState = false;
ValueNotifier<bool> fabStateNotifier = ValueNotifier<bool>(fabTafState);

void setFabTafState(bool b) {
  fabTafState = b;
    fabStateNotifier.value = fabTafState;
}

ValueNotifier<IconData> fabIconNotifier =
    ValueNotifier<IconData>(Icons.play_arrow);

class FABNotifier extends ChangeNotifier {
  void fabPressed() {
    notifyListeners();
  }
}
