import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/global/globals.dart';
import 'package:flutter_application_1/src/screens/TaskPage.dart';
// import 'package:flutter_application_1/src/widgets/AddTaskWidget.dart';
import 'package:flutter_application_1/src/widgets/TaskCardWidget.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 35.0, left: 10, right: 10),
          child: Stack(
            children: [
              // Container(
              //   margin: EdgeInsets.only(top: 150),
              //   child: Image(
              //     image: AssetImage('assets/studying.png'),
              //   ),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(children: [
                      TaskCardWidget(
                        title: "English",
                        description:
                            "Paper due tommorow night, make some last edit changes",
                        percentage: .90,
                        icon: "english",
                      ),
                      TaskCardWidget(
                        title: "Physic HW",
                        description: "Watch video, then start HW13",
                        percentage: .6,
                        icon: "science",
                      ),
                      TaskCardWidget(
                        title: "Linear Algebra Test",
                        description: "Review notes from chapters 5-6",
                        percentage: .25,
                        icon: "calc",
                      ),
                      TaskCardWidget(
                        title: "Finish Objective 5",
                        description: "",
                        percentage: .30,
                        icon: "coding",
                      ),
                      TaskCardWidget(
                        title: "Physic Final",
                        description: "Review notes from chapters 1-15",
                        percentage: .0,
                        icon: "science",
                      )
                    ]),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Icon(Icons.add),
          backgroundColor: Global.Oxfordblue,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TaskPage()));
          }),
    );
  }
}
