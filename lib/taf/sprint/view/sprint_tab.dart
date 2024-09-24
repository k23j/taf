import 'package:flutter/material.dart';
import 'package:taf/notifier/dynamic_fab/dynamic_fab_data.dart';
import 'package:taf/notifier/dynamic_fab/fab_mixin.dart';
import 'package:taf/notifier/dynamic_fab/fab_notifier.dart';
import 'package:taf/participant/models/participant.dart';
import 'package:taf/participant/models/participant_group.dart';
import 'package:taf/taf/commom/timer_controller.dart';
import 'package:taf/taf/sprint/data/default_sprint_course.dart';
import 'package:taf/taf/sprint/view/sprint_participant_list.dart';
import 'package:taf/taf/sprint/view/sprint_stat_widget.dart';
import 'package:taf/taf/sprint/view/sprint_timer.dart';
import 'package:taf/taf/view/group_selection_widget.dart';

class SprintTab extends StatefulWidget {
  const SprintTab({super.key});

  @override
  State<SprintTab> createState() => SprintTabState();
}

class SprintTabState extends State<SprintTab> with FABMixin {
  //ParticipantGroup? selectedGroup;
  TimerController timerController = TimerController();

  //bool get isGroupSelected => selectedGroup != null;

  // void onGroupSelection(ParticipantGroup? group) {
  //   setState(() {
  //     selectedGroup = group;
  //   });

  //   setFabTafState(isGroupSelected);
  // }

  @override
  void onFabPressed() {
    print('FabPressedOnSprintTab');
  }

  @override
  void initState() {
    initFabMixin(
        DynamicFabData(isDefault: true, icon: Icons.access_alarms_outlined));
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
              ),
            ],
          ),
          // ListenableBuilder(
          //   listenable: timerController.stateNotifier,
          //   builder: (context, child) {
          //     return IgnorePointer(
          //         ignoring: timerController.stateNotifier.value !=
          //             TimerStateEnum.stop,
          //         child: child!);
          //   },
          //   child: GroupSelectionWidget(onGroupSelect: onGroupSelection),
          // ),
          // if (isGroupSelected)
          Expanded(
              child: SprintParticipantList(
            participantList: [],
            course: standardSprintCourse,
            timerController: timerController,
          )),
        ],
      ),
    );
  }
}
