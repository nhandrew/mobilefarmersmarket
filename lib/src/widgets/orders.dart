
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Orders extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS){
      return CupertinoPageScaffold( 
        child: pageBody(),
      );
    } else {
      return Scaffold(
        body: pageBody(),
      );
    }
  }

  Widget pageBody() {
    return Center(child: Text('Orders'),);
  }
}