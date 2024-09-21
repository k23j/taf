import 'package:flutter/material.dart';
import 'package:taf/notifier/fab_notifier.dart';
import 'package:taf/participant/models/participant_group.dart';
import 'package:taf/test/commom/timer_controller.dart';
import 'package:taf/test/sprint/data/default_sprint_course.dart';
import 'package:taf/test/sprint/view/sprint_participant_list.dart';
import 'package:taf/test/sprint/view/sprint_stat_widget.dart';
import 'package:taf/test/sprint/view/sprint_timer.dart';
import 'package:taf/test/view/group_selection_widget.dart';

class SprintTab extends StatefulWidget {
  final FABNotifier fabNotifier;
  const SprintTab({required this.fabNotifier, super.key});

  @override
  State<SprintTab> createState() => _SprintTabState();
}

class _SprintTabState extends State<SprintTab> {
  ParticipantGroup? selectedGroup;
  TimerController timerController = TimerController();

  bool get isGroupSelected => selectedGroup != null;

  void onGroupSelection(ParticipantGroup? group) {
    setState(() {
      selectedGroup = group;
    });

    setFabTafState(isGroupSelected);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SprintStatWidget(),
              SprintTimer(
                controler: timerController,
                fabNotifier: widget.fabNotifier,
              ),
            ],
          ),
          ListenableBuilder(
            listenable: timerController.stateNotifier,
            builder: (context, child) {
              return IgnorePointer(
                  ignoring: timerController.stateNotifier.value !=
                      TimerStateEnum.stop,
                  child: child!);
            },
            child: GroupSelectionWidget(onGroupSelect: onGroupSelection),
          ),
          if (isGroupSelected)
            Expanded(
                child: SprintParticipantList(
              group: selectedGroup!,
              course: standardSprintCourse,
              timerController: timerController,
            )),
        ],
      ),
    );
  }
}
