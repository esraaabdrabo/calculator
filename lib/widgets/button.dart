import 'package:calc/view_model/setting.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../assets/theme_data.dart';

class CustomButton extends StatelessWidget {
  Color color;
  Function() fun;
  String text;

  CustomButton(
      {required this.color, required this.fun, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    SettingVM settingProvider = Provider.of(context);

    return InkWell(
      onTap: fun,
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
                color: text == 'C'
                    ? Colors.white
                    : settingProvider.currentThemeData.grey),
          )),
    );
  }
}

class ResultButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingVM settingProvider = Provider.of(context);
    return InkWell(
      onTap: () {},
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
