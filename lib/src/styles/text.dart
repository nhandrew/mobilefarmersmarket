import 'package:farmers_market/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static TextStyle get body {
    return GoogleFonts.roboto(
        textStyle: TextStyle(color: AppColors.darkgray, fontSize: 16.0));
  }

   static TextStyle get suggestion {
    return GoogleFonts.roboto(
        textStyle: TextStyle(color: AppColors.lightgray, fontSize: 14.0));
  }

}
