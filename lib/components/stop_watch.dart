import 'package:flutter/material.dart';
import 'package:pomodoro/components/stop_watch_button.dart';

class PomodoroStopWatch extends StatelessWidget {
  const PomodoroStopWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Time to Work',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          const SizedBox(height: 20),
          const Text(
            '25:00',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 120, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StopWatchButton(text: 'Start', icon: Icon(Icons.play_arrow)),
              StopWatchButton(text: 'Stop', icon: Icon(Icons.stop)),
              StopWatchButton(text: 'Reset', icon: Icon(Icons.refresh)),
            ],
          )
        ],
      ),
    );
  }
}
