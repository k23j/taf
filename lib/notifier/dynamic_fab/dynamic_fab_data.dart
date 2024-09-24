import 'package:flutter/material.dart';

class DynamicFabData {
  bool enabled;
  bool isDefault;
  IconData? icon;
  late VoidCallback onPressed;

  DynamicFabData(
      {this.enabled = true, this.icon, this.isDefault = false});
}
