import 'package:flutter/material.dart';
import 'package:taf/test/sprint/data/pace_enum.dart';
import 'package:taf/test/sprint/models/lap_data.dart';
import 'package:taf/utils/date_formatter.dart';
import 'package:taf/utils/duration_formatter.dart';

class LapDataWidget extends StatelessWidget {
  final LapData data;
  const LapDataWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 32),
      leading: Text('Volta ${data.lapNumber}', style: Theme.of(context).textTheme.bodySmall),
      title: Row(
        children: [Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,      
            children: [
              Text('Inicio: ${formatDate(data.beginOn)}', style: Theme.of(context).textTheme.bodySmall),
              Text('Término: ${formatDate(data.endOn)}', style: Theme.of(context).textTheme.bodySmall),
              Text('Duração: ${formatDurationLabeled(data.duration)}', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
        greatPaceIcon,
        ]
      ),
    );
  }
}
