import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:taf/notifier/fab_notifier.dart';
import 'package:taf/test/commom/timer_controller.dart';
import 'package:taf/utils/date_formatter.dart';
import 'package:taf/utils/duration_formatter.dart';

class SprintTimer extends StatefulWidget {
  final TimerController controler;
  final FABNotifier fabNotifier;

  const SprintTimer(
      {required this.controler, required this.fabNotifier, super.key});

  @override
  State<SprintTimer> createState() => _SprintTimerState();
}

class _SprintTimerState extends State<SprintTimer>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late Ticker ticker;
  Duration elapsedTime = Duration.zero;
  bool running = false;

  @override
  void initState() {
    ticker = Ticker(_onTick);
    widget.fabNotifier.addListener(startStopTest);
    super.initState();
  }

  void startStopTest() {
    //Cancel
    if (running) {
      widget.controler.stop();
      ticker.stop();
      setState(() {
        running = !running;
      });
    }
    //Start
    else {
      widget.controler.start();
      ticker.start();
      setState(() {
        running = !running;
      });
    }
  }

  void _onTick(Duration elapsed) {
    setState(() {
      elapsedTime = elapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.controler.onGoing)
          Text('Início em   ${formatDate(widget.controler.beginOn)}'),
        if (widget.controler.onGoing) Text(formatDurationDetailed(elapsedTime)),
        // IconButton(onPressed: startStopTest, icon: Icon(Icons.play_arrow),),
        // TextButton.icon(
        //   iconAlignment: IconAlignment.end,
        //   icon: Icon(running ? Icons.close : Icons.play_arrow),
        //   onPressed: startStopTest,
        //   label: Text(running ? 'Cancelar Teste' : 'Iniciar Teste'),
        // )
      ],
    );
  }
}
