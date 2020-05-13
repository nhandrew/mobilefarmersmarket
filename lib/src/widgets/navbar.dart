import 'package:farmers_market/src/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppNavbar {

  static CupertinoSliverNavigationBar cupertinoNavBar ({String title, BuildContext context}) {
    return CupertinoSliverNavigationBar(  
      largeTitle: Text(title, style: TextStyles.navTitle),
      backgroundColor: Colors.transparent,
      border: null,
    );
  }
}