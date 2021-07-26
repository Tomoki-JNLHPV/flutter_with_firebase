import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_with_firebase/user.dart';
import 'package:flutter_with_firebase/user_list_model.dart';
import 'package:provider/provider.dart';

class UserListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserListModel>(
      create: (_) => UserListModel()..fetchUsers(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('User List'),
        ),
        body: Consumer<UserListModel>(
          builder: (context, model, child) {
            final users = model.users;
            final listTiles = users
                .map(
                  (user) => ListTile(
                    title: Text(user.name),
                    onLongPress: () async {
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('${user.name}を削除します。'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('削除'),
                                  onPressed: () async {
                                    Navigator.of(context).pop();

                                    await deleteUser(context, model, user);
                                  },
                                )
                              ],
                            );
                          });
                    },
                  ),
                )
                .toList();
            return ListView(children: listTiles);
          },
        ),
      ),
    );
  }

  Future deleteUser(
    BuildContext context,
    UserListModel model,
    User user,
  ) async {
    try {
      await model.deleteUser(user);
      await model.fetchUsers();
    } catch (e) {
      await _showDialog(context, e.toString());
      print(e.toString());
    }
  }

  Future<void> _showDialog(BuildContext context, String string) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('name'),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
