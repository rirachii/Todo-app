import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/global/globals.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function onPressed;

  ButtonWidget({
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: Global.Oxfordblue,
      minimumSize: Size(320, 60),
      // padding: EdgeInsets.symmetric(horizontal: 100),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
    return ElevatedButton(
      onPressed: onPressed,
      style: raisedButtonStyle,
      child: Text(title),
    );
  }
}
