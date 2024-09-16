import 'package:flutter/material.dart';
import 'package:taf/participant/models/participant_group.dart';
import 'package:taf/participant/view/participant_list_tile.dart';

class ParticipantGroupListTile extends StatelessWidget {
  final ParticipantGroup data;

  const ParticipantGroupListTile(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(data.groupName),
      subtitle: Text('${data.subjectList.length} Integrantes'),
      childrenPadding: const EdgeInsets.all(12),
      children: data.subjectList.map((e) => ParticipantListTile(e),).toList(),
    );
  }
}
