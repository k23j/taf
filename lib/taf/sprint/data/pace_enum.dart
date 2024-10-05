import 'package:flutter/material.dart';

const String greatPaceTitle = "Excelente Ritmo";
const String goodPaceTitle = "Bom Ritmo";
const String averagePaceTitle = "Ritmo Regular";
const String badPaceTitle = "Ritmo Ruim";
const String ineptPaceTitle = "Ritmo Inapto";

const Tooltip greatPaceIcon = Tooltip(
    message: greatPaceTitle,
    child: Icon(Icons.keyboard_double_arrow_up, color: Colors.green));
const Tooltip goodPaceIcon = Tooltip(
    message: goodPaceTitle,
    child: Icon(Icons.keyboard_arrow_up, color: Colors.green));
const Tooltip averagePaceIcon = Tooltip(
  message: averagePaceTitle,
  child: Icon(Icons.remove, color: Colors.blue),
);
const Tooltip badPaceIcon = Tooltip(
    message: badPaceTitle,
    child: Icon(Icons.keyboard_arrow_down, color: Colors.red));
const Tooltip ineptPaceIcon = Tooltip(
    message: ineptPaceTitle,
    child: Icon(Icons.keyboard_double_arrow_down, color: Colors.red));

const double smallIconSize = 14;

const Tooltip greatPaceIconSmall = Tooltip(
    message: greatPaceTitle,
    child: Icon(
      Icons.keyboard_double_arrow_up,
      color: Colors.green,
      size: smallIconSize,
    ));
const Tooltip goodPaceIconSmall = Tooltip(
    message: goodPaceTitle,
    child: Icon(Icons.keyboard_arrow_up,
        color: Colors.green, size: smallIconSize));
const Tooltip averagePaceIconSmall = Tooltip(
  message: averagePaceTitle,
  child: Icon(Icons.remove, color: Colors.blue, size: smallIconSize),
);
const Tooltip badPaceIconSmall = Tooltip(
    message: badPaceTitle,
    child: Icon(Icons.keyboard_arrow_down,
        color: Colors.red, size: smallIconSize));
const Tooltip ineptPaceIconSmall = Tooltip(
    message: ineptPaceTitle,
    child: Icon(Icons.keyboard_double_arrow_down,
        color: Colors.red, size: smallIconSize));

enum PaceEnum {
  great(
      name: greatPaceTitle, icon: greatPaceIcon, iconSmall: greatPaceIconSmall),
  good(name: goodPaceTitle, icon: goodPaceIcon, iconSmall: goodPaceIconSmall),
  average(
      name: averagePaceTitle,
      icon: averagePaceIcon,
      iconSmall: averagePaceIconSmall),
  bad(name: badPaceTitle, icon: badPaceIcon, iconSmall: badPaceIconSmall),
  inept(
      name: ineptPaceTitle, icon: ineptPaceIcon, iconSmall: ineptPaceIconSmall);

  const PaceEnum({
    required this.name,
    required this.icon,
    required this.iconSmall,
  });

  final String name;
  final Tooltip icon;
  final Tooltip iconSmall;
}
