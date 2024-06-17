import 'package:flutter/material.dart';

class StatBox extends StatelessWidget {
  final String title;
  final int value;

  const StatBox({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 18)),
        Text(value.toString(), style: const TextStyle(fontSize: 24)),
      ],
    );
  }
}
