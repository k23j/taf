import 'package:flutter/material.dart';
import 'package:taf/fab/fab_data.dart';

class FABNotifier extends ChangeNotifier {
  FABData? data;

  void setData(FABData fabData) {
    data = fabData;
    notifyListeners();
  }

  void disable() {
    data = null;
    notifyListeners();
  }

  void fabPressed() {
    if (data != null) {data!.onPressed();}
  }
}