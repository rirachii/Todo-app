// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/src/global/globals.dart';
// import 'package:flutter_application_1/src/services/firestore_service.dart';
// import 'package:flutter_application_1/src/widgets/EditItem.dart';

// class EditTaskPage extends StatefulWidget {
//   final String currentTitle;
//   final String currentDescription;
//   final String documentId;

//   EditTaskPage({
//     this.currentTitle,
//     this.currentDescription,
//     this.documentId,
//   });
//   @override
//   _EditTaskPageState createState() => _EditTaskPageState();
// }

// class _EditTaskPageState extends State<EditTaskPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Global.Oxfordblue,
//           title: Text(widget.currentTitle),
//           actions: [
//             IconButton(
//               icon: Icon(
//                 Icons.delete_forever,
//                 size: 30,
//               ),
//               onPressed: () async {
//                 await FirestoreService.deleteItem(
//                   docId: widget.documentId,
//                 );
//                 Navigator.pop(context, () {
//                   setState(() {});
//                 });
//               },
//             ),
//           ],
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.only(
//               left: 16.0,
//               right: 16.0,
//               bottom: 20.0,
//             ),
//             // child: EditItem(
//             //   documentId: widget.documentId,
//             //   currentTitle: widget.currentTitle,
//             //   currentDescription: widget.currentDescription,
//             // ),
//           ),
//         ));
//   }
// }
