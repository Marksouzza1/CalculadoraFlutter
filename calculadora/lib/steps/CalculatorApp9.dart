import 'package:flutter/material.dart';

class CalculatorApp9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  buttonPressed(String buttonText) {
  switch (buttonText) {
    case 'C':
      _output = '';
      num1 = 0;
      num2 = 0;
      operand = '';
      break;
    case '+/-':
    _output = (double.parse(_output) * -1).toString();
    break;
    case '+':
    case '-':
    case '×':
    case '÷':
      if (operand != '') {
        num2 = double.parse(_output);
        _calculateResult();
      } else {
      num1 = double.parse(_output);
      operand = buttonText;
      _output = '';
      }
      break;
    case '=':
      num2 = double.parse(_output);
      _calculateResult();
      break;
    default:
    if (num1 != 0 && num2 != 0 && operand != '') {
      _output = '';
      num1 = 0;
      num2 = 0;
      operand = '';
      _output += buttonText;
      break;
    }
      _output += buttonText;
      break;
  }
  setState(() {});
}

void _calculateResult() {
  double result = 0;
  switch (operand) {
    case '+':
      result = num1 + num2;
      break;
    case '-':
      result = num1 - num2;
      break;
    case '×':
      result = num1 * num2;
      break;
    case '÷':
      result = num1 / num2;
      break;
  }
  _output = result.toString();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(24.0),
              alignment: Alignment.bottomRight,
              child: Text(
                    (num1 != 0 ? num1.toString() + " " : '') +
                    (operand.isNotEmpty ? operand + " " : '') +
                    (num2 != 0 ? num2.toString() : ''),
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(24.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('C'),
                      buildButton('+/-'),
                      buildButton('%'),
                      buildButton('÷'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('7'),
                      buildButton('8'),
                      buildButton('9'),
                      buildButton('×'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('4'),
                      buildButton('5'),
                      buildButton('6'),
                      buildButton('-'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('1'),
                      buildButton('2'),
                      buildButton('3'),
                      buildButton('+'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      
                      buildButton('0'),
                      buildButton('.'),
                      buildButton('='),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: OutlinedButton(
          onPressed: () {
            buttonPressed(buttonText);
          },
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
