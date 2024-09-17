import 'package:flutter/material.dart';
import 'package:taf/participant/models/participant_group.dart';
import 'package:taf/test/sprint/view/sprint_participant_tile.dart';

class SprintParticipantList extends StatelessWidget {
  final ParticipantGroup group;

  const SprintParticipantList(this.group, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: group.length,
      itemBuilder: (context, index) =>
          SprintParticipantTile(group.subjectList[index]),
      separatorBuilder: (context, index) => const SizedBox(
        height: 4,
      ),
    );
  }
}
