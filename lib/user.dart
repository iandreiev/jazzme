import 'package:flutter/material.dart';
import 'package:jazzme/UI/appbar.dart';
import 'package:jazzme/UI/button.dart';
import 'package:jazzme/UI/circle_button.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JazzBar(
        title: "Profile",
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      Text("Musician"),
                      Text("Ivan Andreyev"),
                      Text("@andreyev")
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[Text("Rating"), Text("500")],
                    ),
                    JazzCircleBTN(
                      splashColor: 0xFFF1F1F1,
                      fillColor: 0xFFFFFFFF,
                      iconColor: 0xFF42B937,
                      icon: Icons.add,
                      semanticTitle: "Follow",
                      onPressed: () {
                        print("Call Donate");
                      },
                    ),
                    JazzCircleBTN(
                      splashColor: 0xFFF1F1F1,
                      fillColor: 0xFFFFFFFF,
                      iconColor: 0xFF42B937,
                      icon: Icons.payment,
                      semanticTitle: "Donate",
                      onPressed: () {
                        print("Call Donate");
                      },
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
