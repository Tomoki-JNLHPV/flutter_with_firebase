import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User(DocumentSnapshot doc) {
    documentID = doc.documentID;
    name = doc['name'];
  }

  late String documentID;
  late String name;
}
