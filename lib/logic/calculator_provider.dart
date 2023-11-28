import 'package:flutter/material.dart';

import 'calculator_state.dart';
import 'key_symbol.dart';
import 'keys.dart';

class CalculatorProvider extends ChangeNotifier {
  final CalculatorState _state = CalculatorState();

  String get currentInput => _state.currentInput;
  double get result => _state.result;

  static KeySymbol? _operator;
  static String _valA = '0';
  static String _valB = '0';
  static String? _result;

  void processCalculation(dynamic event) {
    KeySymbol key = (event as KeySymbol);

    switch (key.type) {
      case KeyType.FUNCTION:
        return handleFunction(key);

      case KeyType.OPERATOR:
        return handleOperator(key);

      case KeyType.INTEGER:
        return handleInteger(key);
    }
  }

  static void handleFunction(KeySymbol key) {
    if (_valA == '0') {
      return;
    }

    if (key == Keys.decimal) {
      _decimal();
    } else if (key == Keys.clear) {
      _clear();
    }
  }

  static void _decimal() {
    if (_valB != '0' && !_valB.contains('.')) {
      _valB = _valB + '.';
    } else if (_valA != '0' && !_valA.contains('.')) {
      _valA = _valA + '.';
    }
  }

  static void _clear() {
    _valA = _valB = '0';
    _operator = _result = null;
  }

  static void handleOperator(KeySymbol key) {
    if (_valA == '0') {
      return;
    }
    if (key == Keys.equals) {
      return _calculate();
    }

    _operator = key;
  }

  static void handleInteger(KeySymbol key) {
    String val = key.value;
    if (_operator == null) {
      _valA = (_valA == '0') ? val : _valA + val;
    } else {
      _valB = (_valB == '0') ? val : _valB + val;
    }
  }

  static void _calculate() {
    if (_operator == null || _valB == '0') {
      return;
    }

    Map<KeySymbol, dynamic> table = {
      Keys.divide: (a, b) => (a / b),
      Keys.multiply: (a, b) => (a * b),
      Keys.subtract: (a, b) => (a - b),
      Keys.add: (a, b) => (a + b)
    };

    double result = table[_operator](double.parse(_valA), double.parse(_valB));
    String str = result.toString();

    while ((str.contains('.') && str.endsWith('0')) || str.endsWith('.')) {
      str = str.substring(0, str.length - 1);
    }

    _result = str;
  }

  void showOutput(double value) {
    _state.showOutput(value);
    notifyListeners();
  }

  void clear() {
    _state.clear();
    notifyListeners();
  }
}
