import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting().then((_) => runApp(App()));
}

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       title: 'Flutter Demo',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//         child: NestedScrollView(
//       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//         return <Widget>[
//           CupertinoSliverNavigationBar(
//             largeTitle: Text('Settings'),
//           )
//         ];
//       },
//       body: Center(
//         child: ListView(children: [
//           TaskCardWidget(
//             title: "English",
//             description:
//                 "Paper due tommorow night, make some last edit changes",
//             percentage: .90,
//             icon: "english",
//           ),
//         ]),
//       ),
//     ));
//   }
// }
