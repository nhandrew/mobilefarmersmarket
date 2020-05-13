import 'package:flutter/cupertino.dart';

abstract class AppNavbar {

  static CupertinoSliverNavigationBar cupertinoNavBar ({String title, BuildContext context}) {
    return CupertinoSliverNavigationBar(  
      largeTitle: Text(title),
    );
  }
}