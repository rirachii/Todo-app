import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/screens/auth/LoginScreen.dart';
// import 'package:flutter_application_1/src/screens/Navigation.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos',
      home: LoginScreen(),
      theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      })),
    );
  }
}
