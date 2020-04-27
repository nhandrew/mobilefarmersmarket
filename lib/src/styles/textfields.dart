import 'package:farmers_market/src/styles/base.dart';
import 'package:farmers_market/src/styles/colors.dart';
import 'package:farmers_market/src/styles/text.dart';
import 'package:flutter/material.dart';

abstract class TextFieldStyles {
  static double textBoxHorizontal() {
    return 25.0;
  }

  static double textBoxVertical() {
    return 8.0;
  }

  static TextStyle text() {
    return TextStyles.body();
  }

  static TextStyle placeholder() {
    return TextStyles.suggestion();
  }

  static Color cursorColor() {
    return AppColors.darkblue();
  }

  static Widget iconPrefix(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Icon(icon, size: 35.0, color: AppColors.lightblue()),
    );
  }

  static TextAlign textAlign(){
    return TextAlign.center;
  }

  static BoxDecoration cupertinoDecoration() {
    return BoxDecoration(
        border: Border.all(
          color: AppColors.straw(),
          width: BaseStyles.borderWidth(),
        ),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius()));
  }
}
