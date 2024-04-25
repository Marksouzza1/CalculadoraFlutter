import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  String result = '';

buttonPressed(String buttonText) {
  if (buttonText == "C") {
    _output = "";
    num1 = 0;
    num2 = 0;
    operand = "";
  } else if (buttonText == "+" || buttonText == "-" || buttonText == "×" || buttonText == "÷") {
    if (operand != "") {
      buttonPressed("=");
    }
    num1 = double.parse(_output.replaceAll(',', '.'));
    operand = buttonText;
    _output += buttonText;
  } else if (buttonText == "=") {
  if (operand != "" && _output != "") {
    num2 = double.parse(_output.substring(1).replaceAll(',', '.'));
    if (operand == "+") {
      _output = (num1 + num2).toString();
    } else if (operand == "-") {
      _output = (num1 - num2).toString();
    } else if (operand == "×") {
      _output = (num1 * num2).toString();
    } else if (operand == "÷") {
      _output = (num1 / num2).toString();
    }
    operand = "";
    num1 = 0;
    num2 = 0;
  }

  } else {
    _output += buttonText;
  }
  setState(() {});
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
                      buildButton('7'),
                      buildButton('8'),
                      buildButton('9'),
                      buildButton('÷'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('4'),
                      buildButton('5'),
                      buildButton('6'),
                      buildButton('×'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('1'),
                      buildButton('2'),
                      buildButton('3'),
                      buildButton('-'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('C'),
                      buildButton('0'),
                      buildButton('.'),
                      buildButton('='),
                      buildButton('+'),
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
}
