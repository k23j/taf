import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SprintTimer extends StatefulWidget {
  const SprintTimer({super.key});

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
    super.initState();
  }

  void startStopTest() {
    if (running) {
      setState(() {
        ticker.stop();
        running = !running;
      });
    } else {
      setState(() {
        ticker.start();
        running = !running;
      });
    }
  }

  void _onTick(Duration elapsed) {
    setState(() {
      elapsedTime = elapsed;
    });
  }

  String durationToString(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds % 60;
    int milliseconds = duration.inMilliseconds % 1000 ~/ 10;

    return '${_twoDigits(minutes)}:${_twoDigits(seconds)}.${_threeDigits(milliseconds)}';
  }

  String _twoDigits(int number) => number.toString().padLeft(2, '0');
  String _threeDigits(int number) => number.toString().padLeft(3, '0');

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(durationToString(elapsedTime)),
        // IconButton(onPressed: startStopTest, icon: Icon(Icons.play_arrow),),
        TextButton.icon(
          iconAlignment: IconAlignment.end,
          icon: Icon(running ? Icons.close : Icons.play_arrow),
          onPressed: startStopTest,
          label: Text(running ? 'Cancelar Teste' : 'Iniciar Teste'),
        )
      ],
    );
  }
}
