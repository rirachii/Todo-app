import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/global/globals.dart';
import 'package:flutter_application_1/src/screens/Login.dart';
// import 'package:flutter_application_1/src/screens/Navigation.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos',
      home: LoginScreen(),
    );
  }
}
