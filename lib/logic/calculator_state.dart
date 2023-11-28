class CalculatorState {
  String currentInput = '';
  String operation = '';
  double result = 0.0;

  void clear() {
    currentInput = '';
    operation = '';
    result = 0.0;
  }

  void showOutput(double value) {
    result += value;
  }
}
