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
        ),
      ),
    );
  }
}
