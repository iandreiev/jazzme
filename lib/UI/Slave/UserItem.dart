import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String name;
  final String username;
  final String type;
  final String photo;

  UserItem(
      {this.name, this.photo, this.username, this.type, @required this.onTap})
      : assert(name != null);

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage("$photo"),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Text(name,
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: "TTCommons",
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                IconButton(icon: Icon(Icons.person_add), onPressed: () {})
              ],
            ),
          ),
        ],
      ),
    );
  }
}
