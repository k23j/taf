class LapData {
  final DateTime beginOn;
  final int lapNumber;

  DateTime? endOn;
  Duration? duration;

  bool finished = false;

  LapData(this.beginOn, this.lapNumber);

  void endLap(DateTime endOn) {
    finished = true;
    this.endOn = endOn;
    duration = endOn.difference(beginOn);
  }
}
