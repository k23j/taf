import 'package:flutter/material.dart';
import 'package:taf/participant/models/gender.dart';

class GenderSwitch extends StatelessWidget {
  final Gender value;
  final Function(Gender gender) onGenderChange;

  const GenderSwitch(
      {required this.value, required this.onGenderChange, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 130,child: Text('Gênero: ${value.gender}')),
          Checkbox.adaptive(
              value: value.isMasculine,
              onChanged: (b) {
                if (b == null) {
                  return;
                }
                onGenderChange(Gender.fromBool(b));
              })
        ]);
  }
}
