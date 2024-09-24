import 'package:flutter/material.dart';
import 'package:taf/participant/models/participant.dart';
import 'package:taf/participant/models/participant_group.dart';
import 'package:taf/taf/commom/timer_controller.dart';
import 'package:taf/taf/sprint/models/sprint_course.dart';
import 'package:taf/taf/sprint/view/sprint_participant_tile.dart';

class SprintParticipantList extends StatelessWidget {
  final List<Participant> participantList;
  final SprintCourse course;
  final TimerController timerController;

  const SprintParticipantList(
      {required this.participantList, required this.course, required this.timerController, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: participantList.length,
      itemBuilder: (context, index) => SprintParticipantTile(
        participant: participantList[index],
        course: course,
        timerController: timerController,
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 4,
      ),
    );
  }
}
