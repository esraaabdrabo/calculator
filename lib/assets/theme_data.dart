import 'package:flutter/material.dart';

class ModeData {
  var scaffoldBG = const LinearGradient(
    colors: [Color(0xff4b4f50), Color(0xff1d2124)],
  );
  var basicOperations = const Color(0xff49335c);
  var optionalOperations = const Color(0xff4c453b);
  var normalButton = const Color(0xff404245);
  var yellow = const Color(0xfffdb82c);
  var grey = const Color(0xffa6aeae);
  var result = const Color(0xff8f29df);
  ModeData(
      {required this.basicOperations,
      required this.grey,
      required this.normalButton,
      required this.optionalOperations,
      required this.result,
      required this.scaffoldBG,
      required this.yellow});
}

class DarkModeData extends ModeData {
  DarkModeData()
      : super(
            basicOperations: const Color(0xff49335c),
            scaffoldBG: const LinearGradient(
                colors: [Color(0xff4b4f50), Color(0xff1d2124)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            optionalOperations: const Color(0xff4c453b),
            normalButton: const Color(0xff404245),
            yellow: const Color(0xfffdb82c),
            grey: const Color(0xffa6aeae),
            result: const Color(0xff8f29df));
}

class LightModeData extends ModeData {
  LightModeData()
      : super(
            basicOperations: const Color(0xffe1d5e9),
            scaffoldBG: const LinearGradient(
                colors: [Color(0xfffefefe), Color(0xffe9edf0)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            optionalOperations: const Color(0xfff6f0e4),
            normalButton: const Color(0xfff3f5f7),
            yellow: const Color(0xfffdb82d),
            grey: const Color(0xff5d686e),
            result: const Color(0xff8f27de));
}


