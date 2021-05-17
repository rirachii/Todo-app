import 'package:flutter/material.dart';

class SubTaskWidget extends StatefulWidget {
  String taskname;
  SubTaskWidget({this.taskname});
  @override
  _SubTaskWidgetState createState() => _SubTaskWidgetState();
}

class _SubTaskWidgetState extends State<SubTaskWidget> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.taskname,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
      ),
      autofocus: true,
      controlAffinity: ListTileControlAffinity.leading,
      selected: _checked,
      value: _checked,
      onChanged: (bool value) {
        setState(() {
          _checked = value;
        });
      },
      activeColor: Colors.green,
    );
  }
}
