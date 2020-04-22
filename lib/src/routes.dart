import 'package:farmers_market/src/screens/landing.dart';
import 'package:farmers_market/src/screens/login.dart';
import 'package:farmers_market/src/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Routes {

  static MaterialPageRoute materialRoutes(RouteSettings settings){
    switch(settings.name){
      case "/":
      return MaterialPageRoute(builder: (context) => Landing());
      break;
      case "/signup":
      return MaterialPageRoute(builder: (context) => Signup());
      break;
      case "/login":
      return MaterialPageRoute(builder: (context) => Login());
      default:
      return MaterialPageRoute(builder: (context) => Login());
      break;
    }
  }

    static CupertinoPageRoute cupertinoRoutes(RouteSettings settings){
    switch(settings.name){
      case "/":
      return CupertinoPageRoute(builder: (context) => Landing());
      break;
      case "/signup":
      return CupertinoPageRoute(builder: (context) => Signup());
      break;
      case "/login":
      return CupertinoPageRoute(builder: (context) => Login());
      default:
      return CupertinoPageRoute(builder: (context) => Login());
      break;
    }
  }
}