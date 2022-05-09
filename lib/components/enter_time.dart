import 'package:flutter/material.dart';

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

  Widget valueButton(Icon icon, Function()? action) {
    return ElevatedButton(
      onPressed: action,
      child: icon,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
        primary: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 25)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            valueButton(const Icon(Icons.arrow_downward), decrement),
            Text(
              "$value min",
              style: const TextStyle(fontSize: 18),
            ),
            valueButton(const Icon(Icons.arrow_upward), increment)
          ],
        ),
      ],
    );
  }
}
