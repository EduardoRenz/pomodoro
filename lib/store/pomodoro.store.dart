import 'dart:async';

import 'package:mobx/mobx.dart';
part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum PomodoroState { work, rest }

abstract class _PomodoroStore with Store {
  @observable
  bool started = false;

  @observable
  int minutes = 2;

  @observable
  int seconds = 0;

  @observable
  int workTime = 2;

  @observable
  int restTime = 1;

  @observable
  PomodoroState state = PomodoroState.work;

  @observable
  Timer? timer;

  @action
  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (_timer) {
      if (minutes == 0 && seconds == 0) {
        _switchState();
      } else if (seconds == 0) {
        seconds = 59;
        minutes--;
      } else {
        seconds--;
      }
    });
  }

  @action
  void stop() {
    started = false;
    timer?.cancel();
  }

  @action
  void reset() {
    started = false;
    stop();
    minutes = isWorking() ? workTime : restTime;
    seconds = 0;
  }

  @action
  void incrementWorkTime() {
    workTime++;
    if (isWorking()) {
      reset();
    }
  }

  @action
  void decrementWorkTime() {
    workTime--;
    if (isWorking()) {
      reset();
    }
  }

  @action
  void incrementRestTime() {
    restTime++;
    if (isResting()) {
      reset();
    }
  }

  @action
  void decrementRestTime() {
    restTime--;
    if (isResting()) {
      reset();
    }
  }

  bool isWorking() {
    return state == PomodoroState.work;
  }

  bool isResting() {
    return state == PomodoroState.rest;
  }

  void _switchState() {
    if (isWorking()) {
      state = PomodoroState.rest;
      minutes = restTime;
    } else {
      state = PomodoroState.work;
      minutes = workTime;
    }
    seconds = 0;
  }
}
