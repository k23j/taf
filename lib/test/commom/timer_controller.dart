import 'dart:async';
import 'package:flutter/material.dart';

enum TimerStateEnum { play, stop, pause, resume }

class TimerController {
  ValueNotifier<int> secondsNotifier = ValueNotifier<int>(0);
  ValueNotifier<TimerStateEnum> stateNotifier =
      ValueNotifier<TimerStateEnum>(TimerStateEnum.stop);
  DateTime? beginOn;
  bool get onGoing => stateNotifier.value == TimerStateEnum.play || stateNotifier.value == TimerStateEnum.resume;

  Timer? _timer;

  void start() {
    // Start the timer and update state.
    beginOn = DateTime.now();
    stateNotifier.value = TimerStateEnum.play;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsNotifier.value += 1;
    });
  }

  void pause() {
    // Pause the timer and update state.
    stateNotifier.value = TimerStateEnum.pause;
    _timer?.cancel();
  }

  void resume() {
    // Resume the timer and update state.
    stateNotifier.value = TimerStateEnum.resume;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsNotifier.value += 1;
    });
  }

  void stop() {
    // Stop the timer, reset the counter, and update state.
    stateNotifier.value = TimerStateEnum.stop;
    _timer?.cancel();
    secondsNotifier.value = 0;
  }

  void dispose() {
    _timer?.cancel();
    secondsNotifier.dispose();
    stateNotifier.dispose();
  }
}
