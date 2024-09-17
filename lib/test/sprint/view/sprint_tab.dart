import 'package:flutter/material.dart';
import 'package:taf/participant/models/participant.dart';
import 'package:taf/participant/models/participant_group.dart';
import 'package:taf/test/sprint/view/sprint_participant_list.dart';
import 'package:taf/test/sprint/view/sprint_participant_tile.dart';
import 'package:taf/test/sprint/view/sprint_stat_widget.dart';
import 'package:taf/test/sprint/view/sprint_timer.dart';
import 'package:taf/test/view/group_selection_widget.dart';

class SprintTab extends StatefulWidget {
  const SprintTab({super.key});

  @override
  State<SprintTab> createState() => _SprintTabState();
}

class _SprintTabState extends State<SprintTab> {
  ParticipantGroup? selectedGroup;

  bool get groupSelected => selectedGroup != null;

  void onGroupSelection(ParticipantGroup? group) {
    setState(() {
      selectedGroup = group;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SprintStatWidget(),
              SprintTimer(),
            ],
          ),
          GroupSelectionWidget(onGroupSelect: onGroupSelection),
          if (groupSelected) Expanded(child: SprintParticipantList(selectedGroup!)),
        ],
      ),
    );
  }
}
