import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/global/globals.dart';
import 'package:flutter_application_1/src/screens/pages/AddTaskPage.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskCardWidget extends StatefulWidget {
  final String title;
  final String description;
  final double percentage;
  final String icon;
  final String docID;
  TaskCardWidget(
      {this.title,
      this.description,
      this.percentage = .00,
      this.icon,
      this.docID});
  @override
  _TaskCardWidgetState createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  @override
  Widget build(BuildContext context) {
    final String course = widget.icon;
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddTaskPage(
                    currentTitle: widget.title,
                    currentDescription: widget.description,
                    documentId: widget.docID,
                    course: widget.icon,
                    percentage: widget.percentage,
                  )));
        },
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 5,
              bottom: 5,
              left: 5,
              right: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Global.Oxfordblue, Global.Grapejuice],
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/$course.png'),
                  height: 75,
                  width: 75,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        widget.title ?? "(Task Name)",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.0),
                        child: Text(
                          widget.description ?? "(Description)",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                new CircularPercentIndicator(
                  radius: 70.0,
                  lineWidth: 7.5,
                  animation: true,
                  percent: widget.percentage,
                  center: new Text(
                    (widget.percentage * 100).toString() + "%",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Global.Grapefruit,
                  backgroundColor: Global.Grapejuice,
                ),
              ],
            )));
  }
}
