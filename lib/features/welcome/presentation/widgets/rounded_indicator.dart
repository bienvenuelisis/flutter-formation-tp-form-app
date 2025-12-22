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

class StepsIndicators extends StatelessWidget {
  const StepsIndicators({
    super.key,
    this.currentIndex = 0,
    required this.count,
  });

  final int count;

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      spacing: 8,
      children: List.generate(
        count,
        (index) => StepIndicator(
          color: index == currentIndex ? Colors.green : Colors.grey,
          height: 8,
          width: (width - 32 - (8 * (count - 1))) / count,
        ),
      ),
    );
  }
}

class StepIndicator extends StatelessWidget {
  const StepIndicator({
    super.key,
    this.color = Colors.green,
    required this.height,
    required this.width,
  });

  final Color color;

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
