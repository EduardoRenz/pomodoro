import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/enter_time.dart';
import 'package:pomodoro/components/stop_watch.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Scaffold(
        body: Observer(
      builder: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(child: PomodoroStopWatch()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                EnterTime(
                  title: 'Work',
                  value: store.workTime,
                  increment: store.started && store.isWorking()
                      ? null
                      : store.incrementWorkTime,
                  decrement: store.started && store.isWorking()
                      ? null
                      : store.decrementWorkTime,
                ),
                EnterTime(
                  title: 'Rest',
                  value: store.restTime,
                  increment: store.started && store.isResting()
                      ? null
                      : store.incrementRestTime,
                  decrement: store.started && store.isResting()
                      ? null
                      : store.decrementRestTime,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
