import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/stop_watch_button.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class PomodoroStopWatch extends StatelessWidget {
  const PomodoroStopWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(
        builder: (_) => Container(
              color: store.isWorking() ? Colors.red : Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    store.isWorking() ? 'Time to Work' : 'Time to Rest',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 120, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (!store.started)
                        StopWatchButton(
                            text: 'Start',
                            icon: const Icon(Icons.play_arrow),
                            onPressed: store.start),
                      if (store.started)
                        StopWatchButton(
                            text: 'Stop',
                            icon: const Icon(Icons.stop),
                            onPressed: store.stop),
                      StopWatchButton(
                          text: 'Reset',
                          icon: const Icon(Icons.refresh),
                          onPressed: store.reset),
                    ],
                  )
                ],
              ),
            ));
  }
}
