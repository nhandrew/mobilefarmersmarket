import 'package:farmers_market/src/styles/base.dart';
import 'package:farmers_market/src/styles/colors.dart';
import 'package:farmers_market/src/styles/text.dart';
import 'package:farmers_market/src/widgets/button.dart';
import 'package:farmers_market/src/widgets/list_tile.dart';
import 'package:farmers_market/src/widgets/sliver_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return AppSliverScaffold.cupertinoSliverScaffold(
        navTitle: 'Upcoming Markets',
        pageBody: Scaffold(body: pageBody(context)),
      );
    } else {
      return AppSliverScaffold.materialSliverScaffold(
          navTitle: 'Upcoming Markets', pageBody: pageBody(context));
    }
  }

  Widget pageBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Image.asset('assets/images/market.jpg'),
                top: -10.0,),
              Positioned(
                bottom: 10.0,
                right: 10.0,
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.lightblue,
                        borderRadius:
                            BorderRadius.circular(BaseStyles.borderRadius)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Vendor Page',
                          style: TextStyles.buttonTextLight),
                    ),
                  ),
                  onTap: () => Navigator.of(context).pushNamed('/vendor'),
                ),
              )
            ],
          ),
          flex: 2,
        ),
        Flexible(
          child: ListView(
            children: <Widget>[
              AppListTile(
                date: '4',
                month: 'Oct',
                title: 'Anytown Farmer\'s Market',
                location: '1 Main St, Anytown, US',
                acceptingOrders: true,
              ),
              AppListTile(
                  date: '14',
                  month: 'Oct',
                  title: 'Anytown Farmer\'s Market',
                  location: '1 Main St, Anytown, US'),
              AppListTile(
                  date: '20',
                  month: 'Oct',
                  title: 'Anytown Farmer\'s Market',
                  location: '1 Main St, Anytown, US'),
              AppListTile(
                  date: '24',
                  month: 'Oct',
                  title: 'Anytown Farmer\'s Market',
                  location: '1 Main St, Anytown, US'),
              AppListTile(
                  date: '24',
                  month: 'Oct',
                  title: 'Anytown Farmer\'s Market',
                  location: '1 Main St, Anytown, US'),
              AppListTile(
                  date: '24',
                  month: 'Oct',
                  title: 'Anytown Farmer\'s Market',
                  location: '1 Main St, Anytown, US'),
              AppListTile(
                  date: '24',
                  month: 'Oct',
                  title: 'Anytown Farmer\'s Market',
                  location: '1 Main St, Anytown, US'),
              AppListTile(
                  date: '24',
                  month: 'Oct',
                  title: 'Anytown Farmer\'s Market',
                  location: '1 Main St, Anytown, US'),
            ],
          ),
          flex: 3,
        )
      ],
    );
  }
}
