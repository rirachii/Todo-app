import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/global/globals.dart';
// import 'package:flutter_application_1/src/screens/CalendarPage.dart';
import 'package:flutter_application_1/src/screens/TimerPage.dart';
import 'package:flutter_application_1/src/screens/TodoPage.dart';
import 'package:flutter_application_1/src/screens/SettingPage.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    TodoList(),
    // TimerPage(),
    // CalendarPage(),
    SettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Studying Mindfully"),
      //   backgroundColor: Colors.amber,
      //   actions: <Widget>[
      //     IconButton(icon: Icon(Icons.search), onPressed: null),
      //     IconButton(icon: Icon(Icons.weekend), onPressed: null)
      //   ],
      // ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Global.Grapefruit,
        unselectedItemColor: Colors.black,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.list_rounded),
          //   label: "",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: "",
          ),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.calendar_today_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
