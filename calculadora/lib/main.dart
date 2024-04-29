import 'package:calculadora/view/calculator_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp10());
}


class CalculatorApp10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: CalculatorView(),
    );
  }
}