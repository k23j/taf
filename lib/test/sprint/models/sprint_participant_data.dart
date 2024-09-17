import 'package:taf/participant/models/participant.dart';
import 'package:taf/test/sprint/models/sprint_course.dart';

class SprintParticipantData {
  final Participant participant;
  final DateTime beginOn;
  final SprintCourse course;

  SprintParticipantData(
      {required this.participant,
      required this.beginOn,
      required this.course}) {
    addLap(beginOn);
  }

  late final DateTime endOn;
  late final Duration duration;
  late final double grade;

  int currentLap = 0;

  List<LapData> lapDataList = [];

  void addLap(DateTime beginOn) {
    lapDataList.add(LapData(beginOn));
  }

  void endLap(DateTime endOn) {
    lapDataList[currentLap].endLap(endOn);

    //If the last lap is finished
    if (course.lapCount == currentLap) {
      endSprint(endOn);
      return;
    }

    addLap(beginOn);
  }

  void endSprint(DateTime endOn) {
    this.endOn = endOn;
    duration = endOn.difference(beginOn);
  }
}

class LapData {
  final DateTime beginOn;
  late final DateTime endOn;
  late final Duration duration;

  LapData(this.beginOn);

  void endLap(DateTime endOn) {
    this.endOn = endOn;
    duration = endOn.difference(beginOn);
  }
}
