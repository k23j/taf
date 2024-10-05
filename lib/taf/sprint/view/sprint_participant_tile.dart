import 'package:flutter/material.dart';
import 'package:taf/participant/models/participant.dart';
import 'package:taf/taf/commom/timer_controller.dart';
import 'package:taf/taf/sprint/data/pace_enum.dart';
import 'package:taf/taf/sprint/models/lap_data.dart';
import 'package:taf/taf/sprint/models/sprint_course.dart';
import 'package:taf/taf/sprint/models/sprint_participant_data.dart';
import 'package:taf/taf/sprint/view/lap_data_widget.dart';
import 'package:taf/utils/duration_formatter.dart';

class SprintParticipantTile extends StatefulWidget {
  final int participantNumber;
  final Participant participant;
  final SprintCourse course;
  final TimerController timerController;

  const SprintParticipantTile(
      {required this.participantNumber,
      required this.participant,
      required this.course,
      required this.timerController,
      super.key});

  @override
  State<SprintParticipantTile> createState() => _SprintParticipantTileState();
}

class _SprintParticipantTileState extends State<SprintParticipantTile> {
  PaceEnum pace = PaceEnum.average;
  SprintParticipantData? participantData;

  Duration durationOffset = Duration.zero;

  int currentLap = 1;
  bool finished = false;

  @override
  void initState() {
    widget.timerController.stateNotifier.addListener(
        () => onStateChange(widget.timerController.stateNotifier.value));
    super.initState();
  }

  void onStateChange(TimerStateEnum newState) {
    switch (newState) {
      case TimerStateEnum.play:
        beginSprint();
      case TimerStateEnum.stop:
        cancelSprint();
      default:
    }
  }

  void beginSprint() {
    setState(() {
      participantData = SprintParticipantData(
          participant: widget.participant,
          beginOn: DateTime.now(),
          course: widget.course);
    });
  }

  void cancelSprint() {
    participantData = null;
  }

  void finishSprint() {
    participantData!.endLap(DateTime.now());
    setState(() {
      finished = true;
    });
  }

  void completeLap() {
    //Finish sprint
    if (currentLap == widget.course.lapCount) {
      finishSprint();
    }
    //Next lap
    else {
      participantData!.endLap(DateTime.now());
      setState(() {
        currentLap++;
        durationOffset =
            Duration(seconds: widget.timerController.secondsNotifier.value);
      });
    }
  }

  void updatePace() {
    setState(() {
      //TODO: Implement logic
      //TODO: Using placeholder logic
      pace = PaceEnum.great;
    });
  }

  List<LapDataWidget> getLapDataWidgetList() {
    return participantData?.lapDataList
            .map((lapData) => LapDataWidget(lapData))
            .toList()
            .reversed
            .toList() ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        //color: Theme.of(context).colorScheme.surface,
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(children: [
                CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.onSecondary,
                    child: Text(widget.participantNumber.toString())),
                const SizedBox(width: 8),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(widget.participant.toString()),
                  Text(widget.participant.nip),
                ]),
                const Spacer(),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text('Volta $currentLap/${widget.course.lapCount}'),
                  ListenableBuilder(
                    listenable: widget.timerController.secondsNotifier,
                    builder: (context, child) {
                      final Duration elapsed = Duration(
                          seconds:
                              widget.timerController.secondsNotifier.value);
                      final Duration timeOnCurrentLap =
                          elapsed - durationOffset;
                      return Text(formatDuration(timeOnCurrentLap));
                    },
                  ),
                ]),
                const SizedBox(width: 8),
                pace.icon,
                const SizedBox(width: 8),
                IconButton.filledTonal(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Theme.of(context).colorScheme.onSecondary)),
                  icon: const Icon(Icons.flag_outlined),
                  onPressed: completeLap,
                ),
              ]),
              const SizedBox(height: 8),
              LapTimeGroup(
                  widget.course.lapCount, participantData?.lapDataList),
            ])));
  }
}

class LapTimeGroup extends StatelessWidget {
  final int lapCount;
  final List<LapData>? lapDataList;

  const LapTimeGroup(this.lapCount, this.lapDataList, {super.key});

  List<Widget> get lapTimeList {
    int lapTimeWidgetId = 0;
    List<LapTimeWidget> lapTimeList = List.generate(
        lapCount,
        (index) => LapTimeWidget(
            index + 1,
            (lapDataList != null && index < lapDataList!.length)
                ? lapDataList![index]
                : null));

    return List.generate(lapCount + (lapCount - 1), (index) {
      if (index % 2 == 0) {
        return lapTimeList[lapTimeWidgetId++];
      } else {
        return Text('|');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: const BorderRadius.all(Radius.circular(6))),
        child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(mainAxisSize: MainAxisSize.max, children: lapTimeList)));
  }
}

// class LapTime extends StatelessWidget {
//   const LapTime({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text('Volta1', style: TextStyle().copyWith(fontSize: 10)),
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Text('2:15', style: TextStyle().copyWith(fontSize: 10)),
//             SizedBox(width: 4),
//             Icon(Icons.remove, size: 10),
//           ])
//         ]);
//   }
// }

class LapTimeWidget extends StatelessWidget {
  final int lapNumber;
  final LapData? data;

  const LapTimeWidget(this.lapNumber, this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Text('Volta $lapNumber', style: TextStyle().copyWith(fontSize: 10)),
      const SizedBox(height: 2),
      data != null && data!.finished
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  const SizedBox(width: 3),
                  Text(formatDuration(data!.duration!),
                      style: TextStyle().copyWith(fontSize: 10)),
                  //SizedBox(width: 4),
                  data!.pace!.iconSmall,
                  //Icon(Icons.remove, size: 10),
                ])
          : Text('-', style: const TextStyle().copyWith(fontSize: 10)),
    ]));
  }
}
