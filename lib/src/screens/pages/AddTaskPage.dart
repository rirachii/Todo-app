import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/global/globals.dart';
import 'package:flutter_application_1/src/services/firestore_service.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AddTaskPage extends StatefulWidget {
  final String currentTitle;
  final String currentDescription;
  final String course;
  final String documentId;
  final double percentage;

  AddTaskPage({
    this.currentTitle,
    this.currentDescription,
    this.course,
    this.documentId,
    this.percentage,
  });
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final auth = FirebaseAuth.instance;

  bool _update = false;

  final titleController = TextEditingController();
  final desController = TextEditingController();
  final percentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    desController.dispose();
    percentController.dispose();
    super.dispose();
  }

  var _course = [
    "English",
    "Math",
    "Science",
    "Programming",
    "Engineering",
    "Economics"
  ];
  var _currentItemSeleted = "English";

  @override
  Widget build(BuildContext context) {
    User user = auth.currentUser;
    String userid = user.uid;
    FirestoreService.uid = userid;
    // var _currentItemSeleted = "English";

    if (widget.currentTitle != null) {
      titleController.text = widget.currentTitle;
      desController.text = widget.currentDescription;
      percentController.text = (widget.percentage * 100).toString();
      _update = true;
      setState(() {
        _currentItemSeleted = widget.course;
      });
    }
    return Scaffold(
      backgroundColor: Global.OffWhite,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Global.OffWhite,
        title: Text(
          widget.currentTitle ?? "Add Task",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete_forever,
              size: 30,
              color: Colors.red[800],
            ),
            onPressed: () async {
              if (_update = true) {
                await FirestoreService.deleteItem(
                  docId: widget.documentId,
                );
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Task Title...",
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Global.DarkBlue,
                ),
              ),
              TextField(
                controller: desController,
                decoration: InputDecoration(
                  hintText: "Description...",
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              DropdownButton<String>(
                value: _currentItemSeleted,
                hint: Text("Select Course"),
                isExpanded: true,
                icon: Icon(Icons.arrow_drop_down_rounded),
                iconSize: 35,
                items: _course.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String courseSelected) {
                  setState(() {
                    _currentItemSeleted = courseSelected;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: new CircularPercentIndicator(
                  radius: 250.0,
                  lineWidth: 22,
                  animation: true,
                  percent: widget.percentage != null ? widget.percentage : 0,
                  center: new Text(
                    (widget.percentage != null
                                ? widget.percentage * 100
                                : 0 / 100)
                            .toInt()
                            .toString() +
                        "%",
                    style: new TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 25.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Global.Grapefruit,
                  backgroundColor: Global.Grapejuice,
                ),
              ),
              Expanded(
                  child: TextField(
                keyboardType: TextInputType.number,
                controller: percentController,
                decoration: InputDecoration(
                  hintText: "Percentage Completed",
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 18.0,
                ),
                // onSubmitted: (value) {
                //   if (value != "") {
                //     if (widget.documentId == null) {
                //       FirestoreService.addSubTodo();
                //     }
                //   }
                // },
              )),
              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: Text(
              //     "Sub-Tasks",
              //     style: TextStyle(
              //       fontSize: 32,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // Expanded(
              //   child: StreamBuilder<DocumentSnapshot>(
              //     stream: FirestoreService.getSubTodo(),
              //     builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              //       if (snapshot.hasError) {
              //         return Text('Something went wrong');
              //       } else if (snapshot.hasData || snapshot.data != null) {
              //         var subtodosDoc = snapshot.data;
              //         var subtodos = subtodosDoc['todos'];
              //         print(subtodos[0]);
              //         return ListView.separated(
              //           separatorBuilder: (context, index) =>
              //               SizedBox(height: 10.0),
              //           itemCount: subtodos != null ? subtodos.length : 0,
              //           itemBuilder: (context, int index) {
              //             print(subtodos[index]);
              //             // print(subtodos[0]['todos']);
              //             // var noteInfo = snapshot.data[index].data();
              //             // String titleName = noteInfo['title'];
              //             return SubTaskWidget(
              //               taskname: snapshot.data["todos"][index]["name"],
              //             );
              //           },
              //         );
              //       }

              //       return Center(
              //         child: CircularProgressIndicator(
              //           valueColor:
              //               AlwaysStoppedAnimation<Color>(Global.Oxfordblue),
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Icon(Icons.done_rounded),
          backgroundColor: Colors.green,
          onPressed: () async {
            if (titleController.text.isNotEmpty && _update == false) {
              await FirestoreService.addTask(
                title: titleController.text,
                des: desController.text,
                course: _currentItemSeleted,
                percent: double.parse(
                    (double.parse(percentController.text) / 100)
                        .toStringAsFixed(2)),
              );
              print(desController.text +
                  titleController.text +
                  _currentItemSeleted +
                  percentController.text);
              print((double.parse(percentController.text) / 100)
                  .floor()
                  .toDouble());
              Navigator.pop(context);
            } else if (_update == true) {
              await FirestoreService.updateItem(
                title: titleController.text,
                description: desController.text,
                cour: _currentItemSeleted,
                docId: widget.documentId,
                percent: double.parse(
                    (double.parse(percentController.text) / 100)
                        .toStringAsFixed(2)),
              );
              print(desController.text +
                  titleController.text +
                  _currentItemSeleted);
              print((double.parse(percentController.text) / 100)
                  .floor()
                  .toDouble());
              Navigator.pop(context);
            } else {
              Navigator.pop(context);
            }
          }),
    );
  }
}
