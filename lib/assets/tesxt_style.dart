import 'package:calc/view_model/setting.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

abstract class CustomTextStyle {
  static resultTS(Color grey) {
    return GoogleFonts.andika(
        fontSize: 20.sp, fontWeight: FontWeight.w800, color: grey);
  }

  static buttonTS(Color grey) {
    return GoogleFonts.andika(
        fontSize: 15.sp, fontWeight: FontWeight.w800, color: grey);
  }
}
