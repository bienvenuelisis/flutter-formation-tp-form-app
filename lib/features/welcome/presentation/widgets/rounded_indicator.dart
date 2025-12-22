import 'package:flutter/material.dart';

class RoundedIndicator extends StatelessWidget {
  const RoundedIndicator({super.key, this.color = Colors.green});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15,
      height: 15,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
