import 'package:date_format/date_format.dart';
import 'package:farmers_market/src/blocs/customer_bloc.dart';
import 'package:farmers_market/src/models/market.dart';
import 'package:farmers_market/src/styles/base.dart';
import 'package:farmers_market/src/styles/colors.dart';
import 'package:farmers_market/src/styles/text.dart';
import 'package:farmers_market/src/widgets/list_tile.dart';
import 'package:farmers_market/src/widgets/sliver_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var customerBloc = Provider.of<CustomerBloc>(context);
    if (Platform.isIOS) {
      return AppSliverScaffold.cupertinoSliverScaffold(
        navTitle: 'Upcoming Markets',
        pageBody: Scaffold(body: pageBody(context,customerBloc)),
      );
    } else {
      return AppSliverScaffold.materialSliverScaffold(
          navTitle: 'Upcoming Markets', pageBody: pageBody(context,customerBloc));
    }
  }

  Widget pageBody(BuildContext context, CustomerBloc customerBloc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Image.asset('assets/images/beans.jpg'),
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
          child: StreamBuilder<List<Market>>(
            stream: customerBloc.fetchUpcomingMarkets,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Center(child: (Platform.isIOS) 
              ? CupertinoActivityIndicator() 
              : CircularProgressIndicator(),);

              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  var market = snapshot.data[index];
                  var dateEnd = DateTime.parse(market.dateEnd);
                  return AppListTile(
                    marketId: market.marketId,
                    month: formatDate(dateEnd, ['M']), 
                    date: formatDate(dateEnd, ['d']),
                    title: market.title, 
                    location: '${market.location.name}, ${market.location.address}, ${market.location.city}, ${market.location.state}',
                    acceptingOrders: market.acceptingOrders,
                    );
                },
              );
            }
          ),
          flex: 3,
        )
      ],
    );
  }
}
