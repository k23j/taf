import 'package:flutter/material.dart';

const String greatPaceTitle = "Excelente Ritmo";
const String goodPaceTitle = "Bom Ritmo";
const String averagePaceTitle = "Ritmo Regular";
const String badPaceTitle = "Ritmo Ruim";
const String ineptPaceTitle = "Ritmo Inapto";

const Tooltip greatPaceIcon = Tooltip(message: greatPaceTitle, child: Icon(Icons.keyboard_double_arrow_up, color: Colors.green),);
const Tooltip goodPaceIcon = Tooltip(message: goodPaceTitle, child: Icon(Icons.keyboard_arrow_up, color: Colors.green),);
const Tooltip averagePaceIcon = Tooltip(message: averagePaceTitle, child: Icon(Icons.remove, color: Colors.blue),);
const Tooltip badPaceIcon = Tooltip(message: badPaceTitle, child: Icon(Icons.keyboard_arrow_down, color: Colors.red),);
const Tooltip ineptPaceIcon = Tooltip(message: ineptPaceTitle, child: Icon(Icons.keyboard_double_arrow_down, color: Colors.red),);

enum PaceEnum{
  great(name: greatPaceTitle, icon: greatPaceIcon),
  good(name: goodPaceTitle, icon: goodPaceIcon),
  average(name: averagePaceTitle, icon: averagePaceIcon),
  bad(name: badPaceTitle, icon: badPaceIcon),
  inept(name: ineptPaceTitle, icon: ineptPaceIcon);

  const PaceEnum({
    required this.name,
    required this.icon,
  });

  final String name;
  final Tooltip icon;
}