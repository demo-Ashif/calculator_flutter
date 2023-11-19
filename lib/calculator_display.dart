import 'package:flutter/material.dart';

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    super.key,
    required this.value,
    required this.height,
  });

  final String value;
  final double height;

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: Colors.white, fontWeight: FontWeight.w200);

    return Container(
      constraints: BoxConstraints.expand(height: height),
      child: Container(
        padding: EdgeInsets.fromLTRB(32, 32, 32, 32),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.black26, Colors.black45],
          ),
        ),
        child: Text(
          value,
          style: style,
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
