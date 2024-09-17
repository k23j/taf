import 'package:flutter/material.dart';
import 'package:taf/participant/models/participant.dart';

class SprintParticipantTile extends StatefulWidget {
  final Participant participant;

  const SprintParticipantTile(this.participant, {super.key});

  @override
  State<SprintParticipantTile> createState() => _SprintParticipantTileState();
}

class _SprintParticipantTileState extends State<SprintParticipantTile> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.participant.name);
  }
}
