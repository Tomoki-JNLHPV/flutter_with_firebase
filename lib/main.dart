import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_with_firebase/show_firestore_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // <- Debug の 表示を OFF
        home: FirestoreSave());
  }
}

class FirestoreSave extends StatefulWidget {
  @override
  _MyFirestorePageState createState() => _MyFirestorePageState();
}

class _MyFirestorePageState extends State<FirestoreSave> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              child: Text('Save'),
              onPressed: () async {
                // ドキュメント作成
                await Firestore.instance.collection('user').document().setData({
                  'name': 'sato',
                  'age': 20,
                  'sex': 'male',
                  'type': ['A', 'B'],
                  'national': 'JP'
                }); // データ
              },
            ),
            Container(
              // 余白を設けるためContainerでラップします。
              margin: EdgeInsets.only(bottom: 16.0),
              child: RaisedButton(
                child:Text('次のページ'),
                onPressed: () {
// -*--*--*--*--*- Navigator -*--*--*--*--*-
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShowFirestoreData()));
// -*--*--*--*--*- Navigator -*--*--*--*--*-
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
