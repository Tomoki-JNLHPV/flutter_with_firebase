import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowFirestoreData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'firestoreのデータ表示',
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('前のページに戻るよ'),
          onPressed: () {
// -*--*--*--*--*- Navigator -*--*--*--*--*-
            Navigator.pop(context);
// -*--*--*--*--*- Navigator -*--*--*--*--*-
          },
        ),
      ),
    );
  }
}