import "dart:math";

import "package:flutter/material.dart";

class CalculatorApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora",
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  CalculadoraState createState() => CalculadoraState();
}

class CalculadoraState extends State<Calculadora> {
  Color backgroundColor = Colors.blue;
  int random = 0;
  void changeColor() {
    setState(() {
      backgroundColor = Colors
          .primaries[Random().nextInt(Colors.primaries.length)]; // rando da cor
      random = Random().nextInt(100); //random do numero
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GestureDetector(
        onTap: () {
          changeColor();
        },
        child: Container(
            color: backgroundColor,
            child: Center(
              child: Text("$random"),
            )),
      ),
    );
  }
}
