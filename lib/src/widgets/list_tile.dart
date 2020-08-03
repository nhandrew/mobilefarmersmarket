import 'package:farmers_market/src/styles/base.dart';
import 'package:farmers_market/src/styles/colors.dart';
import 'package:farmers_market/src/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppListTile extends StatelessWidget {
  final String month;
  final String date;
  final String title;
  final String location;
  final bool acceptingOrders;
  final String marketId;

  AppListTile({
    @required this.month,
    @required this.date,
    @required this.title,
    @required this.location,
    @required this.marketId,
    this.acceptingOrders = false
  });

  @override
  Widget build(BuildContext context) {
      return Column(
        children: <Widget>[
          ListTile( 
            leading: CircleAvatar(  
              radius: 25.0,
              backgroundColor: AppColors.lightblue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(month,style: TextStyle(color:Colors.white, fontSize: 12.0),),
                  Text(date, style: TextStyles.buttonTextLight)
                ],),
            ),
            title: Text(title,style:TextStyles.subtitle),
            subtitle: Text(location),
            trailing:(acceptingOrders) ? Icon(FontAwesomeIcons.shoppingBasket,color: AppColors.darkblue,): Text(''),
            onTap: (acceptingOrders) ? () => Navigator.of(context).pushNamed('/customer/$marketId'): null,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: BaseStyles.listFieldHorizontal),
            child: Divider(color:AppColors.lightgray),
          )
        ],
      );

  }
}