import 'package:farmers_market/src/widgets/navbar.dart';
import 'package:farmers_market/src/widgets/vendor_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Vendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    if (Platform.isIOS) {
      return CupertinoPageScaffold(  
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget> [
              AppNavbar.cupertinoNavBar(title: 'Vendor Name', context:context),
            ];
          }, 
          body: VendorScaffold.cupertinoTabScaffold),
      );
    } else {
      return Center(child: Scaffold(body: Text('Material'),));
    }
  }
}