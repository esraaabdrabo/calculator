import 'package:calc/view_model/calculator.dart';
import 'package:calc/view_model/setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => ChangeNotifierProvider(
        create: (context) => SettingVM(),
        builder: (context, child) => ChangeNotifierProvider(
            create: (context) => CalculatorVM(),
            child: const MaterialApp(
                debugShowCheckedModeBanner: false, home: Home())),
      ),
    );
  }
}
