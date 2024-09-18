import 'package:flutter/material.dart';
import 'package:taf/participant/models/participant.dart';
import 'package:taf/test/sprint/data/pace_enum.dart';

class SprintParticipantTile extends StatefulWidget {
  final Participant participant;

  const SprintParticipantTile(this.participant, {super.key});

  @override
  State<SprintParticipantTile> createState() => _SprintParticipantTileState();
}

class _SprintParticipantTileState extends State<SprintParticipantTile> {
  PaceEnum pace = PaceEnum.average;

  void completeLap() {}

  void updatePace() {
    setState(() {
      //TODO: Implement logic
      //TODO: Using placeholder logic
      pace = PaceEnum.great;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(controlAffinity: ListTileControlAffinity.leading,
        title: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('CB - ${widget.participant.name}', style: Theme.of(context).textTheme.bodyMedium,),
              Text('Volta 1/6 | Tempo: 0:00', style: Theme.of(context).textTheme.bodyMedium,),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            pace.icon,
            IconButton(onPressed: completeLap, icon: const Icon(Icons.flag_outlined)),
          ],
        ),
      ],
    ));
  }
}
