import 'package:taf/taf/sprint/data/pace_enum.dart';

class LapData {
  final DateTime beginOn;
  final int lapNumber;

  DateTime? endOn;
  Duration? duration;
  PaceEnum? pace;

  bool finished = false;

  LapData(this.beginOn, this.lapNumber);

  void endLap(DateTime endOn) {
    finished = true;
    this.endOn = endOn;
    duration = endOn.difference(beginOn);
    calcPace();
  }

  void calcPace() {
    //TODO: Implement Logic
    pace = PaceEnum.great;
  }
}
