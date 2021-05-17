import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _taskCollection = _firestore.collection('tasks');

class FirestoreService {
  static String uid;

  static Future<void> addTask({
    String title,
    String des,
    String course,
    double percent,
  }) async {
    DocumentReference documentReferencer =
        _taskCollection.doc(uid).collection('todos').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": des,
      "course": course,
      "percent": percent,
      "time": FieldValue.serverTimestamp(),
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem(
      {String title,
      String description,
      String docId,
      String cour,
      double percent}) async {
    DocumentReference documentReferencer =
        _taskCollection.doc(uid).collection('todos').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
      "course": cour,
      "percent": percent,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> getTasks() {
    var result = FirebaseFirestore.instance
        .collection("tasks")
        .doc(uid)
        .collection("todos")
        .orderBy("time")
        .snapshots();

    return result;
  }

  static Future<void> deleteItem({
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _taskCollection.doc(uid).collection('todos').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }

  static Future<void> addSubTodo({
    List<Map> item,
  }) async {
    DocumentReference documentReferencer =
        _taskCollection.doc(uid).collection('subtodos').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "todos": item,
      "time": FieldValue.serverTimestamp(),
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateSubTodo({
    String title,
    String description,
    String docId,
    String cour,
  }) async {
    DocumentReference documentReferencer =
        _taskCollection.doc(uid).collection('subtodos').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
      "course": cour,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<DocumentSnapshot> getSubTodo() {
    var result = FirebaseFirestore.instance
        .collection("tasks")
        .doc(uid)
        .collection("subtodos")
        .doc("g3nFcX3PORgBa8tVK7j6")
        .snapshots();

    return result;
  }

  // static Future<QuerySnapshot> get([])
  // totalTasks() {
  //   var query = _taskCollection.doc(uid).collection('todos');
  //   var querySnapshot = query.snapshots();
  //   var totalEquals = querySnapshot.data.docs;
  //   return totalEquals;
  // }

  // query() {
  //   userTasks
  //       .doc(uid)
  //       .collection("todos")
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       print(doc);
  //     });
  //   });
  // }

  // static Stream<QuerySnapshot> readtodos() {
  //   CollectionReference notesItemCollection =
  //       userTasks.doc(uid).collection('todos');

  //   return notesItemCollection.snapshots();
  // }

//query .where('date', isGreaterThan: DateTime.now().add(Duration(days: -30)).toIso8601String())
//Only returns entries for the past 30 days

  //Upsert (Create and Deletes)
  // Future<void> setEntry(Entry entry) {
  //   var options = SetOptions(merge: true);

  //   return _db
  //       .collection('entries')
  //       .doc(entry.entryId)
  //       .set(entry.toMap(), options);
  // }

  //Delete
  // Future<void> removeEntry(String entryId) {
  //   return _db.collection('entries').doc(entryId).delete();
  // }
}
