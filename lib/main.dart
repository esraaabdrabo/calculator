import 'dart:developer';

import 'package:calc/assets/constants.dart';
import 'package:calc/assets/theme_data.dart';
import 'package:calc/view_model/calculator.dart';
import 'package:calc/view_model/setting.dart';
import 'package:calc/views/offset.dart';
import 'package:calc/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

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
                debugShowCheckedModeBanner: false, home: const Home())),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SettingVM settingProvider = Provider.of(context);
    CalculatorVM calcProvider = Provider.of(context);
    return Scaffold(
        body: AnimatedContainer(
      duration: const Duration(milliseconds: 5000),
      curve: Curves.easeOutCirc,
      width: 100.w,
      decoration:
          BoxDecoration(gradient: settingProvider.currentThemeData.scaffoldBG),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //result
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SizedBox(
                height: 25.h,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      calcProvider.expression,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.andika(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                          color: settingProvider.currentThemeData.grey),
                    )),
              ),
            ),
            //buttons
            SizedBox(
              height: 75.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClearButton(),
                      CustomButton(
                          color: settingProvider
                              .currentThemeData.optionalOperations,
                          text: '√'),
                      CustomButton(
                          color: settingProvider
                              .currentThemeData.optionalOperations,
                          text: '^'),
                      CustomButton(
                          color:
                              settingProvider.currentThemeData.basicOperations,
                          text: 'X'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ModeButton(),
                      CustomButton(
                          color: settingProvider
                              .currentThemeData.optionalOperations,
                          text: '%'),
                      CustomButton(
                          color: settingProvider
                              .currentThemeData.optionalOperations,
                          text: '-'),
                      CustomButton(
                          color:
                              settingProvider.currentThemeData.basicOperations,
                          text: '/'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          color: settingProvider.currentThemeData.normalButton,
                          text: '7'),
                      CustomButton(
                          color: settingProvider.currentThemeData.normalButton,
                          text: '8'),
                      CustomButton(
                          color: settingProvider.currentThemeData.normalButton,
                          text: '9'),
                      CustomButton(
                          color:
                              settingProvider.currentThemeData.basicOperations,
                          text: '-'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          color: settingProvider.currentThemeData.normalButton,
                          text: '4'),
                      CustomButton(
                          color: settingProvider.currentThemeData.normalButton,
                          text: '5'),
                      CustomButton(
                          color: settingProvider.currentThemeData.normalButton,
                          text: '6'),
                      CustomButton(
                          color:
                              settingProvider.currentThemeData.basicOperations,
                          text: '+'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                  color: settingProvider
                                      .currentThemeData.normalButton,
                                  text: '1'),
                              CustomButton(
                                  color: settingProvider
                                      .currentThemeData.normalButton,
                                  text: '2'),
                              CustomButton(
                                  color: settingProvider
                                      .currentThemeData.normalButton,
                                  text: '3'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                  color: settingProvider
                                      .currentThemeData.normalButton,
                                  text: '.'),
                              CustomButton(
                                  color: settingProvider
                                      .currentThemeData.normalButton,
                                  text: '0'),
                              RemoveButton()
                            ],
                          ),
                        ],
                      ),
                      ResultButton()
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
