import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_with_firebase/show_firestore_data2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirestoreSave(),
    );
  }
}

class FirestoreSave extends StatefulWidget {
  @override
  _FirestoreSaveState createState() {
    return _FirestoreSaveState();
  }
}

class _FirestoreSaveState extends State<FirestoreSave> {
  String inputValue = "";
  bool isEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                _showDialog(context);
              },
              child: Text(
                "Add Data",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.lightGreen,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: RaisedButton(
                child: Text('次のページ'),
                onPressed: () {
// -*--*--*--*--*- Navigator -*--*--*--*--*-
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserListPage()));
// -*--*--*--*--*- Navigator -*--*--*--*--*-
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: Text('what is your name'),
            content: TextField(
              //controller: dateTextController,
              decoration: InputDecoration(
                hintText: 'name',
              ),
              onChanged: (text) {
                // 入力値があるなら、それを反映する。
                setState(() {
                  this.inputValue = text;
                });
              },
              autofocus: true,
              // keyboardType: TextInputType.number,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'キャンセル',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () async {
                  await Firestore.instance
                      .collection('user')
                      .document()
                      .setData({
                    'name': '${this.inputValue}',
                  });
                  Navigator.of(context).pop();
                },
                child: Text(
                  '追加',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
