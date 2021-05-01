import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/global/globals.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final bool obscureText;
  final Function onChanged;

  TextFieldWidget({
    this.hintText,
    this.obscureText,
    this.onChanged,
    this.prefixIconData,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: hintText,
          prefixIcon: Icon(
            prefixIconData,
            size: 20,
            color: Global.Oxfordblue,
          ),
          filled: true,
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Global.Oxfordblue),
          )),
    );
  }
}
