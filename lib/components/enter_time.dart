import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class EnterTime extends StatelessWidget {
  final String title;
  final int value;
  final Function()? increment;
  final Function()? decrement;

  const EnterTime({
    Key? key,
    required this.title,
    required this.value,
    required this.increment,
    required this.decrement,
  }) : super(key: key);

  Widget valueButton(Icon icon, Function()? action, PomodoroStore store) {
    return ElevatedButton(
      onPressed: action,
      child: icon,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
        primary: store.isWorking() ? Colors.red : Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(
        builder: (_) => Column(
              children: [
                Text(title, style: const TextStyle(fontSize: 25)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    valueButton(
                        const Icon(Icons.arrow_downward), decrement, store),
                    Text(
                      "$value min",
                      style: const TextStyle(fontSize: 18),
                    ),
                    valueButton(
                        const Icon(Icons.arrow_upward), increment, store)
                  ],
                ),
              ],
            ));
  }
}
