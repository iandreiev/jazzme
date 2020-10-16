import 'package:flutter/material.dart';
import 'package:jazzme/Getters/Get/getPosts.dart';
import 'package:jazzme/Models/Get/Posts.dart';
import 'package:jazzme/UI/Master/JazzBar.dart';

class PostPage extends StatelessWidget {
  final Post post;

  final HttpService httpService = HttpService();

  PostPage({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: JazzBar(
          title: "Post",
          actions: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Column(
              children: <Widget>[
                ListTile(title: Text(post.title)),
                ListTile(
                  subtitle: Text(post.content),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.favorite_border), onPressed: () {}),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
