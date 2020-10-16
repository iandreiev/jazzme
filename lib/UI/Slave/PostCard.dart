import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String content;

  PostCard({this.title, this.content, @required this.onTap})
      : assert(title != null);

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: onTap,
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: "TTCommons",
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  content,
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: "TTCommons",
                      fontSize: 16.0),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.favorite_border), onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.insert_comment), onPressed: () {}),
                ],
              ),
              Row(
                children: <Widget>[Text("Author")],
              )
            ],
          )
        ],
      ),
    );
  }
}
