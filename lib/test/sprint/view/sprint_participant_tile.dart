import 'package:flutter/material.dart';
import 'package:taf/participant/models/participant.dart';
import 'package:taf/test/commom/timer_controller.dart';
import 'package:taf/test/sprint/data/pace_enum.dart';
import 'package:taf/test/sprint/models/sprint_course.dart';
import 'package:taf/test/sprint/models/sprint_participant_data.dart';
import 'package:taf/test/sprint/view/lap_data_widget.dart';
import 'package:taf/utils/duration_formatter.dart';

class SprintParticipantTile extends StatefulWidget {
  final Participant participant;
  final SprintCourse course;
  final TimerController timerController;

  const SprintParticipantTile(
      {required this.participant,
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
      .toList().reversed.toList() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      controlAffinity: ListTileControlAffinity.leading,
      enabled: participantData != null,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CB - ${widget.participant.name}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                finished
                    ?
                    //Finished sprint
                    Text(
                        'Completou em: ${formatDurationDetailed(participantData!.duration)}',
                        style: Theme.of(context).textTheme.bodyMedium)
                    :
                    //Ongoing sprint
                    ListenableBuilder(
                        listenable: widget.timerController.secondsNotifier,
                        builder: (context, child) {
                          final Duration elapsed = Duration(
                              seconds:
                                  widget.timerController.secondsNotifier.value);
                          final Duration timeOnCurrentLap =
                              elapsed - durationOffset;
                          return Text(
                            'Volta $currentLap/${widget.course.lapCount} | Tempo: ${formatDuration(timeOnCurrentLap)}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          );
                        },
                      ),
              ],
            ),
          ),
              if (finished == false)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              pace.icon,
                IconButton(
                    onPressed: completeLap,
                    icon: const Icon(Icons.flag_outlined)),
            ],
          ),
        ],
      ),
      children: getLapDataWidgetList(),
    );
  }
}
