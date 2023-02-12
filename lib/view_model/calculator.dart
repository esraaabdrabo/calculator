import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';

class CalculatorVM extends ChangeNotifier {
  String expression = '';
  String firstNum = '';
  String secondNum = '';
  String operation = '';
  String result = '';
  List<String> opertaions = ['+', '-', 'X', '/', '%', '√'];
  void addToExpression(String value) {
    //check num or oper
    if (opertaions.contains(value)) {
      //value => oper
      handleOperation(value);
    } else {
      //value => num
      storeNumbers(value);
    }

    log('expression $expression /// first $firstNum ///  sec $secondNum');

    notifyListeners();
  }

  bool isSecOperation() {
    bool isSecondOper = false;
    for (var operation in opertaions) {
      isSecondOper = expression.contains(operation);
      if (isSecondOper) {
        break;
      }
    }
    return isSecondOper;
  }

  bool haveErroe() {
    return opertaions.contains(expression[expression.length - 1]);
  }

  handleOperation(String value) {
    if (haveErroe()) {
    } else {
      if (isSecOperation()) {
        //(12+12) +
        //sec oper (calc result) (1+2 => calc result) +
        firstNum = calcResult().toString(); //0
        expression = firstNum;
        secondNum = '';

        //first oper 1+ (exp dont contain oper)
        storeOperation(value);
      } else {
        firstNum = expression;
        operation = value;
      }
      expression += value;
    }
  }

  storeOperation(String value) {
    operation = value;
  }

  storeNumbers(String value) {
    if (isSecOperation()) {
      //sec num 111+25 (contain oper)
      secondNum += value; //255555
    } else {
      //first num 1111 (not contain any oper)
      firstNum += value; //111111

    }
    expression += value;
  }

  double calcResult() {
    log((opertaions.contains(operation)).toString());
    switch (operation) {
      case '+':
        return double.parse(firstNum) + double.parse(secondNum);
      case '-':
        return double.parse(firstNum) - double.parse(secondNum);
      case 'X':
        return double.parse(firstNum) * double.parse(secondNum);
      case '/':
        return double.parse(firstNum) / double.parse(secondNum);
      case '√':
        return double.parse(firstNum) * math.sqrt(double.parse(secondNum));
    }

    return 0;
  }

  void clear() {
    expression = '';
    firstNum = '';
    secondNum = '';
    operation = '';
    result = '';
    notifyListeners();
  }

  void remove() {
    if (expression.isEmpty) {
    } else {
      //12 + 22
      if (isSecOperation()) {
        if (secondNum.isEmpty) {
          operation = '';
        } else {
          //12 + 12 when remove (2)  sec => 12 must remove also from sec 2 sec=>1
          secondNum = secondNum.substring(0, secondNum.length - 1);
        }
      }
      expression = expression.substring(0, expression.length - 1);
      notifyListeners();
    }
  }

  void equal() {
    firstNum = calcResult().toString();
    expression = firstNum;
    notifyListeners();
  }

  //22+12(+) if exp contains one operation => calc result
  //34+
  // user cant  press opertaion key in the start
  // (must include number first) / + (operation)  / (must end expression with number)
  // basic opertaions  * / - + %  at least select one operation in exp
  //experssion cant contain 2 consecutive opertaions(1*/8)
  // [operation negative => minus correct (1*-2) (1--1)  (1/-1) (1+-1)]
  // square root cant have negative number
  // number cant contain 2 consecutive dots  (1..5) => (1.5)
  //The denominator cannot be zero in division (error)
  // 5*(1+2) => 5 * 3 = 15 correct  (priority)
}
