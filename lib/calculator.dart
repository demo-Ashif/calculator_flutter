import 'package:calculator_x/calculator_display.dart';
import 'package:flutter/material.dart';

import 'calculator_key_pad.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    double buttonSize = screen.width / 4;
    double displayHeight = screen.height - (buttonSize * 5) - (buttonSize);
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CalculatorDisplay(value: "", height: displayHeight),
          CalculatorKeyPad()
        ],
      ),
    );
  }
}
