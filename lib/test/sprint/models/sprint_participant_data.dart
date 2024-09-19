import 'package:taf/participant/models/participant.dart';
import 'package:taf/test/sprint/models/lap_data.dart';
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

  int get currentLapId => lapDataList.length - 1;
  int currentLapNumber = 0;

  List<LapData> lapDataList = [];

  void addLap(DateTime beginOn) {
    currentLapNumber++;
    lapDataList.add(LapData(DateTime.now(), currentLapNumber));
  }

  void endLap(DateTime endOn) {
    lapDataList[currentLapId].endLap(endOn);

    //If the last lap is finished
    if (course.lapCount == currentLapNumber) {
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