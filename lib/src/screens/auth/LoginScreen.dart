// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/global/globals.dart';
import 'package:flutter_application_1/src/screens/pages/Navigation.dart';
import 'package:flutter_application_1/src/screens/auth/verify.dart';
// import 'package:flutter_application_1/src/services/auth_service.dart';
import 'package:flutter_application_1/src/services/firestore_service.dart';
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
    // CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Future<void> addUser() {
    //   // Call the user's CollectionReference to add a new user
    //   return users
    //       .add({
    //         'email': _email, // John Doe
    //       })
    //       .then((value) => print("User Added"))
    //       .catchError((error) => print("Failed to add user: $error"));
    // }

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
              // validator:(val) => val.length < 6 ? "Password must be 6 characters long" : null,
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
                User user = auth.currentUser;
                String userid = user.uid;
                FirestoreService.uid = userid;
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
                User user = auth.currentUser;
                String userid = user.uid;
                FirestoreService.uid = userid;

                // addUser();
              },
            ),
          ],
        ),
      ),
    );
  }
}
