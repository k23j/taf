import 'package:flutter/material.dart';
import 'package:taf/participant/models/participant.dart';

class ParticipantListTile extends StatelessWidget {
  final Participant data;

  const ParticipantListTile(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(data.name),);
  }
}
