import 'dart:developer';

import 'package:flutter/cupertino.dart';

class CalculatorVM extends ChangeNotifier {
  String expression = '';
  void addToExpression(String value) {
    expression += value;
    log("new exp $expression");
    notifyListeners();
  }
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
