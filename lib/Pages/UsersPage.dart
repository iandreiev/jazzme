import 'package:flutter/material.dart';
import 'package:jazzme/Getters/Get/getUsers.dart';
import 'package:jazzme/Models/Get/Users.dart';
import 'package:jazzme/UI/Master/JazzBar.dart';
import 'package:jazzme/UI/Slave/UserItem.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JazzBar(
        title: "Users",
      ),
      body: FutureBuilder(
        future: httpService.getUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            List<User> users = snapshot.data;

            return new Column(
              children: <Widget>[
                new Expanded(
                    child: new ListView(
                  children: users
                      .map((User user) =>
                          UserItem(onTap: () {}, name: user.name))
                      .toList(),
                ))
              ],
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
