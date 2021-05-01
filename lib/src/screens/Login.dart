// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/global/globals.dart';
import 'package:flutter_application_1/src/screens/Navigation.dart';
import 'package:flutter_application_1/src/screens/verify.dart';
import 'package:flutter_application_1/src/widgets/ButtonWidget.dart';
import 'package:flutter_application_1/src/widgets/TextFieldWidget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Global.Oxfordblue,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ]),
            ),
            TextFieldWidget(
              hintText: "Email",
              obscureText: false,
              prefixIconData: Icons.mail_outline,
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              hintText: "Password",
              obscureText: true,
              prefixIconData: Icons.lock_outline,
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Forgot Password?",
              style: TextStyle(color: Global.Oxfordblue),
            ),
            SizedBox(
              height: 20.0,
            ),
            ButtonWidget(
              title: 'SIGN IN',
              onPressed: () {
                auth
                    .signInWithEmailAndPassword(
                        email: _email, password: _password)
                    .then((_) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Navigation()));
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            ButtonWidget(
              title: 'CREATE ACCOUNT',
              onPressed: () {
                auth
                    .createUserWithEmailAndPassword(
                        email: _email, password: _password)
                    .then((_) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => VerifyScreen()));
                });
              },
            ),
            // Container(
            //   child: Center(
            //     child: Image.asset("assets/add.png"),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
