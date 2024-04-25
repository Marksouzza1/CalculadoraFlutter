import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora",
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '10';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF9800),
        title: Text("Calculadora"),
      ),
      body: Column(children: [
        Text(_output, //VISOR AQUI
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
        Row(children: [
          OutlinedButton(onPressed: () {}, child: Text("(")),
          OutlinedButton(onPressed: () {}, child: Text(")")),
          OutlinedButton(onPressed: () {}, child: Text("%")),
          OutlinedButton(onPressed: () {}, child: Text("ac")),
        ]),
        Row(children: [
          //Expanded(child:
          OutlinedButton(onPressed: () {}, child: Text("7")),
          OutlinedButton(onPressed: () {}, child: Text("8")),
          OutlinedButton(onPressed: () {}, child: Text("9")),
          OutlinedButton(onPressed: () {}, child: Text("/")),
        ]),
        Row(
          children: [
            OutlinedButton(onPressed: () {}, child: Text("4")),
            OutlinedButton(onPressed: () {}, child: Text("5")),
            OutlinedButton(onPressed: () {}, child: Text("6")),
            OutlinedButton(onPressed: () {}, child: Text("*")),
          ],
        ),
        Row(
          children: [
            OutlinedButton(onPressed: () {}, child: Text("1")),
            OutlinedButton(onPressed: () {}, child: Text("2")),
            OutlinedButton(onPressed: () {}, child: Text("3")),
            OutlinedButton(onPressed: () {}, child: Text("-")),
          ],
        ),
        Row(children: [
          OutlinedButton(onPressed: () {}, child: Text("0")),
          OutlinedButton(onPressed: () {}, child: Text(",")),
          OutlinedButton(onPressed: () {}, child: Text("=")),
          OutlinedButton(onPressed: () {}, child: Text("+")),
        ]),
      ]),
    );
  }
}
