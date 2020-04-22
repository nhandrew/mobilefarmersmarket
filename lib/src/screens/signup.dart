import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Signup extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS){
      return CupertinoPageScaffold(
        child: pageBody(context),
      );
    } else {
      return Scaffold(
        body: pageBody(context),
      );
    }
  }

  Widget pageBody(BuildContext context){
    return Center(child: (Platform.isIOS) 
    ? CupertinoButton(child: Text('Login'),onPressed: (){
      Navigator.pushReplacementNamed(context, '/login');
    },)
    : RaisedButton(child: Text('Login'), onPressed: (){
      Navigator.pushReplacementNamed(context, '/login');
    },)
      );
  }
}