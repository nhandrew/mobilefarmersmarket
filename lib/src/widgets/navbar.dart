import 'package:farmers_market/src/styles/colors.dart';
import 'package:farmers_market/src/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppNavbar {

  static CupertinoSliverNavigationBar cupertinoNavBar ({String title, @required BuildContext context}) {
    return CupertinoSliverNavigationBar(  
      largeTitle: Text(title, style: TextStyles.navTitle),
      backgroundColor: Colors.transparent,
      border: null,
      leading: GestureDetector(child: Icon(CupertinoIcons.back, color: AppColors.straw),onTap: () => Navigator.of(context).pop(),)
    );
  }

  static SliverAppBar materialNavBar({@required String title, bool pinned, TabBar tabBar}) {
    return SliverAppBar(
      title: Text(title, style: TextStyles.navTitleMaterial),
      backgroundColor: AppColors.darkblue,
      bottom: tabBar,
      floating: true,
      pinned: (pinned ==null) ? true : pinned,
      snap: true,
    );

  }
}