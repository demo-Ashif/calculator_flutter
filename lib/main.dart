import 'package:calculator_x/calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic/calculator_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: ChangeNotifierProvider(
        create: (context) => CalculatorProvider(),
        child: Calculator(),
      ),
    );
  }
}
