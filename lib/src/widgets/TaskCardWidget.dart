import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/global/globals.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final double percentage;
  final String icon;
  TaskCardWidget(
      {this.title, this.description, this.percentage = .00, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Global.Oxfordblue, Global.Grapejuice],
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage('assets/${icon}.png'),
              height: 75,
              width: 75,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title ?? "(Task Name)",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      description ?? "(Description)",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
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
              radius: 75.0,
              lineWidth: 8.0,
              animation: true,
              percent: percentage,
              center: new Text(
                (percentage * 100).toString() + "%",
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Global.Grapefruit,
              backgroundColor: Global.Grapejuice,
            ),
          ],
        ));
  }
}
