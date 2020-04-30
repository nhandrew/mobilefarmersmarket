import 'package:farmers_market/src/styles/base.dart';
import 'package:farmers_market/src/styles/textfields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../styles/colors.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: pageBody(context),
      );
    } else {
      return Scaffold(
        body: pageBody(context),
      );
    }
  }

  Widget pageBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0.0),
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .2,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/top_bg.png'),
                  fit: BoxFit.fill)),
        ),
        Container(
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/logo.png')),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: TextFieldStyles.textBoxHorizontal, vertical: TextFieldStyles.textBoxVertical),
          child: email(),
        ),
        password(),
      ],
    );
  }
 
  Widget email(){
    if (Platform.isIOS){
      return CupertinoTextField(  
        keyboardType: TextInputType.emailAddress,
        padding: EdgeInsets.all(12.0),
        placeholder: 'Email',
        placeholderStyle: TextFieldStyles.placeholder,
        style: TextFieldStyles.text,
        textAlign: TextFieldStyles.textAlign,
        cursorColor: TextFieldStyles.cursorColor,
        decoration: TextFieldStyles.cupertinoDecoration,
        prefix: TextFieldStyles.iconPrefix(CupertinoIcons.mail_solid),
      );
    } else {
      return TextField(  
        keyboardType: TextInputType.emailAddress,
        cursorColor: TextFieldStyles.cursorColor,
        style:TextFieldStyles.text,
        textAlign: TextFieldStyles.textAlign,
        decoration: TextFieldStyles.materialDecoration('Email', Icons.email),
      );
    }
  }

  Widget password(){
    if (Platform.isIOS){
      return CupertinoTextField();
    } else {
      return TextField();
    }
  }
}
