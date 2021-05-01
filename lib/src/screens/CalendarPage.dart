// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/src/global/globals.dart';
// import 'package:table_calendar/table_calendar.dart';

// class CalendarPage extends StatefulWidget {
//   @override
//   _CalendarPageState createState() => _CalendarPageState();
// }

// class _CalendarPageState extends State<CalendarPage> {
//   CalendarBuilders _caldendarController = CalendarBuilders();
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime _dateToday =
//       DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
//   DateTime _selectedDay;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${_dateToday}'),
//         backgroundColor: Global.Oxfordblue,
//       ),
//       // body: SingleChildScrollView(
//       //   child: Column(
//       //     crossAxisAlignment: CrossAxisAlignment.start,
//       //     children: <Widget>[
//       //       TableCalendar(
//       //         calendarBuilders: _caldendarController,
//       //       )
//       //     ],
//       //   ),
//       // ),
//       body: TableCalendar(
//         firstDay: DateTime.utc(2020, 3, 20),
//         lastDay: DateTime.utc(2030, 12, 31),
//         focusedDay: _focusedDay,
//         calendarFormat: _calendarFormat,
//         selectedDayPredicate: (day) {
//           return isSameDay(_selectedDay, day);
//         },
//         onDaySelected: (selectedDay, focusedDay) {
//           if (!isSameDay(_selectedDay, selectedDay)) {
//             setState(() {
//               _selectedDay = selectedDay;
//               _focusedDay = focusedDay;
//             });
//           }
//         },
//         onFormatChanged: (format) {
//           if (_calendarFormat != format) {
//             setState(() {
//               _calendarFormat = format;
//             });
//           }
//         },
//         onPageChanged: (focusedDay) {
//           _focusedDay = focusedDay;
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {},
//       ),
//     );
//   }
// }
