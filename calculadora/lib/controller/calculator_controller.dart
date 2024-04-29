import 'package:calculadora/model/calculator_model.dart';

class CalculatorController {
  CalculatorModel model;

  CalculatorController(this.model);

  void buttonPressed(String buttonText) {
   switch (buttonText) {
    case 'C':
      model.output = '';
      model.num1 = 0;
      model.num2 = 0;
      model.operand = '';
      break;
    case '+/-':
    model.output = (double.parse(model.output) * -1).toString();
    break;
    case '+':
    case '-':
    case '×':
    case '÷':
      if (model.operand != '') {
        model.num2 = double.parse(model.output);
        _calculateResult();
      } else {
      model.num1 = double.parse(model.output);
      model.operand = buttonText;
      model.output = '';
      }
      break;
    case '=':
      model.num2 = double.parse(model.output);
      _calculateResult();
      break;
    default:
    if (model.num1 != 0 && model.num2 != 0 && model.operand != '') {
      model.output = '';
      model.num1 = 0;
      model.num2 = 0;
      model.operand = '';
      model.output += buttonText;
      break;
    }
      model.output += buttonText;
      break;
  }
  
  }

  void _calculateResult() {
  double result = 0;
  switch (model.operand) {
    case '+':
      result = model.num1 + model.num2;
      break;
    case '-':
      result = model.num1 - model.num2;
      break;
    case '×':
      result = model.num1 * model.num2;
      break;
    case '÷':
      result = model.num1 / model.num2;
      break;
  }
  model.operand = result.toString();
}
}