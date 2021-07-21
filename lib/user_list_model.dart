import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_with_firebase/user.dart';

class UserListModel extends ChangeNotifier {
  List<User> users = [];

  Future fetchUsers() async {
    final docs = await Firestore.instance.collection('user').getDocuments();
    final users = docs.documents.map((doc) => User(doc)).toList();
    this.users = users;
  }

  Future deleteUser(User user) async {
    await Firestore.instance
        .collection('user')
        .document(user.documentID)
        .delete();
  }
}
