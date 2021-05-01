import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/global/globals.dart';
import 'package:flutter_application_1/src/widgets/TextFieldWidget.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
        child: Center(
          child: Column(
            children: [
              TextFieldWidget(
                hintText: "Task Title",
                obscureText: false,
                prefixIconData: (Icons.arrow_forward_ios_rounded),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Description...",
                  border: InputBorder.none,
                  // contentPadding: EdgeInsets.symmetric(horizontal:
                ),
              )
              // Row(
              //   children: <Widget>[
              //     TextFieldWidget(
              //       hintText: "Title",
              //       obscureText: false,
              //       onChanged: () {},
              //     ),
              //     // Expanded(
              //     //   child: TextField(),
              //     // )
              //   ],
              // )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Icon(Icons.delete_forever_rounded),
          backgroundColor: Colors.red[600],
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
