import 'package:flutter/material.dart';

class StopWatchButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final VoidCallback? onPressed;

  const StopWatchButton({
    Key? key,
    required this.text,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black,
          textStyle: const TextStyle(fontSize: 20, color: Colors.white),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          )),
      onPressed: onPressed,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: icon,
        ),
        Text(text),
      ]),
    );
  }
}
