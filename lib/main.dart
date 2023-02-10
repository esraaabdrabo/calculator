import 'dart:developer';

import 'package:calc/assets/constants.dart';
import 'package:calc/assets/theme_data.dart';
import 'package:calc/view_model/setting.dart';
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
      builder: (context, orientation, deviceType) => MaterialApp(
        home: ChangeNotifierProvider(
            create: (context) => SettingVM(),
            builder: (context, child) => const Home()),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SettingVM settingProvider = Provider.of(context);
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: SingleChildScrollView(
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                  gradient: settingProvider.currentThemeData.scaffoldBG),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          color: settingProvider.currentThemeData.yellow,
                          fun: () {},
                          text: 'C'),
                      CustomButton(
                          color: settingProvider
                              .currentThemeData.optionalOperations,
                          fun: () {},
                          text: '('),
                      CustomButton(
                          color: settingProvider
                              .currentThemeData.optionalOperations,
                          fun: () {},
                          text: ')'),
                      CustomButton(
                          color:
                              settingProvider.currentThemeData.basicOperations,
                          fun: () {},
                          text: 'X'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          color: settingProvider
                              .currentThemeData.optionalOperations,
                          fun: () {},
                          text: '--'),
                      CustomButton(
                          color: settingProvider
                              .currentThemeData.optionalOperations,
                          fun: () {},
                          text: '%'),
                      CustomButton(
                          color: settingProvider
                              .currentThemeData.optionalOperations,
                          fun: () {},
                          text: '-'),
                      CustomButton(
                          color:
                              settingProvider.currentThemeData.basicOperations,
                          fun: () {},
                          text: '/'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          color: settingProvider.currentThemeData.normalButton,
                          fun: () {},
                          text: '7'),
                      CustomButton(
                          color: settingProvider.currentThemeData.normalButton,
                          fun: () {},
                          text: '8'),
                      CustomButton(
                          color: settingProvider.currentThemeData.normalButton,
                          fun: () {},
                          text: '9'),
                      CustomButton(
                          color:
                              settingProvider.currentThemeData.basicOperations,
                          fun: () {},
                          text: '-'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          color: settingProvider.currentThemeData.normalButton,
                          fun: () {},
                          text: '4'),
                      CustomButton(
                          color: settingProvider.currentThemeData.normalButton,
                          fun: () {},
                          text: '5'),
                      CustomButton(
                          color: settingProvider.currentThemeData.normalButton,
                          fun: () {},
                          text: '6'),
                      CustomButton(
                          color:
                              settingProvider.currentThemeData.basicOperations,
                          fun: () {},
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
                                  fun: () {},
                                  text: '1'),
                              CustomButton(
                                  color: settingProvider
                                      .currentThemeData.normalButton,
                                  fun: () {},
                                  text: '2'),
                              CustomButton(
                                  color: settingProvider
                                      .currentThemeData.normalButton,
                                  fun: () {},
                                  text: '3'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                  color: settingProvider
                                      .currentThemeData.normalButton,
                                  fun: () {},
                                  text: '.'),
                              CustomButton(
                                  color: settingProvider
                                      .currentThemeData.normalButton,
                                  fun: () {},
                                  text: '0'),
                              CustomButton(
                                  color: settingProvider
                                      .currentThemeData.normalButton,
                                  fun: () {},
                                  text: 'R'),
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
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
          child: FloatingActionButton(
            onPressed: () {
              settingProvider.changeCurrentMode();
            },
            backgroundColor: settingProvider.currentThemeData.normalButton,
            child: settingProvider.currentMode != darkModeKey
                ? const Icon(
                    Icons.sunny,
                    color: Colors.yellow,
                  )
                : const Icon(
                    Icons.nightlight,
                    color: Colors.blue,
                  ),
          ),
        ),
      ],
    ));
  }
}
