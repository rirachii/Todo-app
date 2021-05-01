import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/global/globals.dart';
import 'package:flutter_application_1/src/screens/Login.dart';
import 'package:flutter_application_1/src/widgets/ButtonWidget.dart';
// import 'package:flutter_application_1/src/widgets/TextFieldWidget.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 50),
              child: Row(children: <Widget>[
                Text(
                  'Settings',
                  style: TextStyle(
                    color: Global.Oxfordblue,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ]),
            ),
            Container(
              child: Container(
                child: Align(
                  alignment: Alignment.center,
                ),
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/original.jpg"))),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            accountOptionRow(context, "Change password"),
            accountOptionRow(context, "Content settings"),
            accountOptionRow(context, "Social"),
            accountOptionRow(context, "Language"),
            accountOptionRow(context, "Privacy and security"),
            SizedBox(
              height: 60.0,
            ),
            ButtonWidget(
              title: 'SIGN OUT',
              onPressed: () {
                auth.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector accountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  // return Scaffold(
  //     body: Container(
  //   child: Padding(
  //     padding: const EdgeInsets.only(left: 15, top: 25, right: 15),
  //     child: ListView(
  //       children: [
  //         Text(
  //           "Settings",
  //           style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
  //         ),
  //         SizedBox(
  //           height: 35,
  //         ),
  //         Center(
  //           child: Stack(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Container(
  //                   child: Align(
  //                     alignment: Alignment.center,
  //                   ),
  //                   width: 130,
  //                   height: 130,
  //                   decoration: BoxDecoration(
  //                       shape: BoxShape.circle,
  //                       image: DecorationImage(
  //                           fit: BoxFit.cover,
  //                           image: AssetImage("assets/pfp.png"))),
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 55,
  //               ),
  //               TextField(
  //                 decoration: InputDecoration(
  //                   labelText: "Full Name",
  //                   floatingLabelBehavior: FloatingLabelBehavior.always,
  //                   hintText: 'Michelle Weng',
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 55,
  //               ),
  //               TextButton(
  //                   onPressed: () {
  //                     auth.signOut();
  //                     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //                         builder: (context) => LoginScreen()));
  //                   },
  //                   child: Align(
  //                     alignment: Alignment.center,
  //                     child: Text("Logout",
  //                         style: TextStyle(fontSize: 20.0),
  //                         textAlign: TextAlign.center),
  //                   )),
  //               // TextButton(
  //               //   child: Text(
  //               //     "Logout",
  //               //     style:
  //               //         TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
  //               //   ),
  //               //   onPressed: () {
  //               //     auth.signOut();
  //               //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //               //         builder: (context) => LoginScreen()));
  //               //   },
  //               // ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  // ));

}
