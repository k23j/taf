import 'package:flutter/material.dart';
import 'package:taf/participant/models/participant_group.dart';
import 'package:taf/taf/commom/timer_controller.dart';
import 'package:taf/taf/sprint/models/sprint_course.dart';
import 'package:taf/taf/sprint/view/sprint_participant_tile.dart';

class SprintParticipantList extends StatelessWidget {
  final ParticipantGroup group;
  final SprintCourse course;
  final TimerController timerController;

  const SprintParticipantList(
      {required this.group,
      required this.course,
      required this.timerController,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: group.length,
      itemBuilder: (context, index) => SprintParticipantTile(
        participantNumber: index + 1,
        participant: group.subjectList[index],
        course: course,
        timerController: timerController,
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 4,
      ),
    );
  }
}
