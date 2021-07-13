import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowFirestoreData extends StatefulWidget {
  @override
  _MyFirestorePageState createState() => _MyFirestorePageState();
}

class _MyFirestorePageState extends State<ShowFirestoreData> {
  List<DocumentSnapshot> documentList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              child: Text('Show Data'),
              onPressed: () async {
                final snapshot = await Firestore.instance
                    .collection('user')
                    .getDocuments();
                setState(() {
                  documentList = snapshot.documents;
                });
              },
            ),
            Column(
              children: documentList.map((document) {
                return ListTile(
                  title: Text('name:${document['name']}'),
                );
              }).toList(),
            ),
            Container(
                child: RaisedButton(
              child: Text('前のページに戻るよ'),
              onPressed: () {
// -*--*--*--*--*- Navigator -*--*--*--*--*-
                Navigator.pop(context);
// -*--*--*--*--*- Navigator -*--*--*--*--*-
              },
            ))
          ],
        ),
      ),
    );
  }
}
