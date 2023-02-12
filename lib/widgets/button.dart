import 'package:calc/view_model/calculator.dart';
import 'package:calc/view_model/setting.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../assets/constants.dart';
import '../assets/theme_data.dart';

class CustomButton extends StatelessWidget {
  Color color;

  String text;

  CustomButton({required this.color, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    SettingVM settingProvider = Provider.of(context);
    CalculatorVM calcProvider = Provider.of(context);
    return InkWell(
      onTap: () {
        calcProvider.addToExpression(text);
      },
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.5.w),
          height: 18.w,
          width: 18.w,
          decoration: BoxDecoration(boxShadow: [
            const BoxShadow(
                offset: Offset(2, 2),
                color: Color.fromARGB(144, 0, 0, 0),
                blurRadius: 2),
            BoxShadow(
                offset: const Offset(-2, -2),
                color: DarkModeData().grey.withOpacity(.5),
                blurRadius: 2)
          ], borderRadius: BorderRadius.circular(7.w), color: color),
          child: Text(
            text,
            style: GoogleFonts.andika(
                fontSize: 15.sp,
                fontWeight: FontWeight.w800,
                color: settingProvider.currentThemeData.grey),
          )),
    );
  }
}

class ResultButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CalculatorVM calcProvider = Provider.of(context);
    SettingVM settingProvider = Provider.of(context);
    return InkWell(
      onTap: () {
        calcProvider.equal();
      },
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.5.w),
          height: 43.w,
          width: 18.w,
          decoration: BoxDecoration(
              boxShadow: [
                const BoxShadow(
                    offset: Offset(2, 2), color: Colors.black, blurRadius: 2),
                BoxShadow(
                    offset: const Offset(-2, -2),
                    color: DarkModeData().grey.withOpacity(.5),
                    blurRadius: 2)
              ],
              borderRadius: BorderRadius.circular(7.w),
              color: settingProvider.currentThemeData.result),
          child: Text(
            '=',
            style: GoogleFonts.andika(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )),
    );
  }
}

class ModeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingVM settingProvider = Provider.of(context);
    return InkWell(
      onTap: () {
        settingProvider.changeCurrentMode();
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.5.w),
        height: 18.w,
        width: 18.w,
        decoration: BoxDecoration(
            boxShadow: [
              const BoxShadow(
                  offset: Offset(2, 2), color: Colors.black, blurRadius: 2),
              BoxShadow(
                  offset: const Offset(-2, -2),
                  color: DarkModeData().grey.withOpacity(.5),
                  blurRadius: 2)
            ],
            borderRadius: BorderRadius.circular(7.w),
            color: settingProvider.currentThemeData.optionalOperations),
        child: settingProvider.currentMode == darkModeKey
            ? const Icon(
                Icons.sunny,
                color: Colors.yellow,
              )
            : const Icon(
                Icons.nightlight,
                color: Colors.blue,
              ),
      ),
    );
  }
}

class ClearButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingVM settingProvider = Provider.of(context);
    CalculatorVM calcProvider = Provider.of(context);
    return InkWell(
        onTap: () {
          calcProvider.clear();
        },
        child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.5.w),
            height: 18.w,
            width: 18.w,
            decoration: BoxDecoration(
                boxShadow: [
                  const BoxShadow(
                      offset: Offset(2, 2), color: Colors.black, blurRadius: 2),
                  BoxShadow(
                      offset: const Offset(-2, -2),
                      color: DarkModeData().grey.withOpacity(.5),
                      blurRadius: 2)
                ],
                borderRadius: BorderRadius.circular(7.w),
                color: settingProvider.currentThemeData.yellow),
            child: Text(
              'C',
              style: GoogleFonts.andika(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            )));
  }
}

class RemoveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingVM settingProvider = Provider.of(context);
    CalculatorVM calcProvider = Provider.of(context);
    return InkWell(
        onTap: () {
          calcProvider.remove();
        },
        child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.5.w),
            height: 18.w,
            width: 18.w,
            decoration: BoxDecoration(
                boxShadow: [
                  const BoxShadow(
                      offset: Offset(2, 2), color: Colors.black, blurRadius: 2),
                  BoxShadow(
                      offset: const Offset(-2, -2),
                      color: DarkModeData().grey.withOpacity(.5),
                      blurRadius: 2)
                ],
                borderRadius: BorderRadius.circular(7.w),
                color: settingProvider.currentThemeData.normalButton),
            child: Icon(
              Icons.backspace_outlined,
              color: settingProvider.currentThemeData.grey,
            )));
  }
}
