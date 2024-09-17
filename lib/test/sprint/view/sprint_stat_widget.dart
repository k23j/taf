import 'package:flutter/material.dart';
import 'package:taf/test/sprint/models/sprint_stat.dart';

class SprintStatWidget extends StatefulWidget {
  const SprintStatWidget({super.key});

  @override
  State<SprintStatWidget> createState() => _SprintStatWidgetState();
}

class _SprintStatWidgetState extends State<SprintStatWidget> {
  SprintData sprintData = SprintData.standard();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Percurso: ${sprintData.course.totalLength}m'),
        Text('Voltas: ${sprintData.course.lapCount}'),
        Text('Volta: ${sprintData.course.lapLength}m'),
      ],
    );
  }
}
