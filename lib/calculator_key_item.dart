import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic/calculator_provider.dart';
import 'logic/key_symbol.dart';
import 'logic/keys.dart';

class CalculatorKey extends StatelessWidget {
  const CalculatorKey({
    super.key,
    required this.symbol,
  });

  final KeySymbol symbol;

  Color get color {
    switch (symbol.type) {
      case KeyType.FUNCTION:
        return Color.fromARGB(255, 143, 141, 141);

      case KeyType.OPERATOR:
        return Color.fromARGB(255, 248, 167, 44);

      case KeyType.INTEGER:
      default:
        return Color.fromARGB(255, 54, 54, 54);
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 4;
    TextStyle style = Theme.of(context)
        .textTheme
        .headlineLarge!
        .copyWith(color: Colors.white);

    return Container(
      width: (symbol == Keys.zero) ? (size * 2) : size,
      child: Container(
        margin: EdgeInsets.all(2),
        padding: EdgeInsets.all(2),
        height: size,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            backgroundColor: color,
            elevation: 4,
          ),
          child: Text(symbol.value, style: style),
          onPressed: () {
            CalculatorProvider provider =
            Provider.of<CalculatorProvider>(context, listen: false);
            provider.processCalculation(symbol);
          },
        ),
      ),
    );
  }
}
