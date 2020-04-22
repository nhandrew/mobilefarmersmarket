import 'package:farmers_market/src/routes.dart';
import 'package:farmers_market/src/screens/login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      onGenerateRoute: Routes.materialRoutes,
    );
  }
}