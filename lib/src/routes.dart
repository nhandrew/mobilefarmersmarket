import 'package:farmers_market/src/screens/edit_product.dart';
import 'package:farmers_market/src/screens/landing.dart';
import 'package:farmers_market/src/screens/login.dart';
import 'package:farmers_market/src/screens/signup.dart';
import 'package:farmers_market/src/screens/vendor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/landing":
        return MaterialPageRoute(builder: (context) => Landing());
      case "/signup":
        return MaterialPageRoute(builder: (context) => Signup());
      case "/login":
        return MaterialPageRoute(builder: (context) => Login());
      case "/vendor":
        return MaterialPageRoute(builder: (context) => Vendor());
      case "/editproduct":
        return MaterialPageRoute(builder: (context) => EditProduct());
      default:
        return MaterialPageRoute(builder: (context) => Login());
    }
  }

  static CupertinoPageRoute cupertinoRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/landing":
        return CupertinoPageRoute(builder: (context) => Landing());
      case "/signup":
        return CupertinoPageRoute(builder: (context) => Signup());
      case "/login":
        return CupertinoPageRoute(builder: (context) => Login());
      case "/vendor":
        return CupertinoPageRoute(builder: (context) => Vendor());
      case "/editproduct":
        return CupertinoPageRoute(builder: (context) => EditProduct());
      default:
        return CupertinoPageRoute(builder: (context) => Login());
    }
  }
}
