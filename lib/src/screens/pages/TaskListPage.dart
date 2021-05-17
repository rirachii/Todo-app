import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/global/globals.dart';
import 'package:flutter_application_1/src/screens/pages/AddTaskPage.dart';
import 'package:flutter_application_1/src/services/firestore_service.dart';
import 'package:flutter_application_1/src/widgets/TaskCardWidget.dart';

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.OffWhite,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Global.OffWhite,
        title: Text(
          "Task List",
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Icon(Icons.add),
          backgroundColor: Global.Oxfordblue,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddTaskPage()));
          }),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 16.0,
            right: 16.0,
          ),

          child: StreamBuilder<QuerySnapshot>(
            stream: FirestoreService.getTasks(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              } else if (snapshot.hasData || snapshot.data != null) {
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 16.0),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    var noteInfo = snapshot.data.docs[index].data();
                    String docID = snapshot.data.docs[index].id;
                    String titleName = noteInfo['title'];
                    String des = noteInfo['description'];
                    String cour = noteInfo['course'];
                    double percent = noteInfo['percent'];
                    return TaskCardWidget(
                      title: titleName,
                      description: des,
                      percentage: percent,
                      icon: cour,
                      docID: docID,
                    );
                  },
                );
              }

              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Global.Oxfordblue),
                ),
              );
            },
          ),

          // Stack(
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Expanded(child: FutureBuilder(
          //                 // initalData: [],
          //                 // future: (),
          //                 builder: (context, snapshot) {
          //           return ListView.builder(
          //             itemCount: 2,
          //             itemBuilder: (context, index) {
          //               return TaskCardWidget(
          //                 title: "",
          //                 description: "",
          //                 percentage: .8,
          //                 icon: "english",
          //               );
          //             },
          //           );
          //         })
          //             // child: ListView(children: [
          //             //   TaskCardWidget(
          //             //     title: "English",
          //             //     description:
          //             //         "Paper due tommorow night, make some last edit changes",
          //             //     percentage: .90,
          //             //     icon: "english",
          //             //   ),
          //             //   TaskCardWidget(
          //             //     title: "Physic HW",
          //             //     description: "Watch video, then start HW13",
          //             //     percentage: .6,
          //             //     icon: "science",
          //             //   ),
          //             //   TaskCardWidget(
          //             //     title: "Linear Algebra Test",
          //             //     description: "Review notes from chapters 5-6",
          //             //     percentage: .25,
          //             //     icon: "calc",
          //             //   ),
          //             //   TaskCardWidget(
          //             //     title: "Finish Objective 5",
          //             //     description: "Due next Friday",
          //             //     percentage: .30,
          //             //     icon: "coding",
          //             //   ),
          //             //   TaskCardWidget(
          //             //     title: "Physic Final",
          //             //     description: "Review notes from chapters 1-15",
          //             //     percentage: .0,
          //             //     icon: "science",
          //             //   )
          //             // ]),
          //             // )
          //             )
          //       ],
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
