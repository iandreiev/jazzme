import 'package:flutter/material.dart';
import 'package:jazzme/UI/appbar.dart';
import 'package:jazzme/Models/post.dart';
import 'package:jazzme/jazz_me_icons_icons.dart';
import 'http_service.dart';

class ArticleDetail extends StatelessWidget {
  final Post post;

  final HttpService httpService = HttpService();

  ArticleDetail({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JazzBar(
        title: "Post",
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(JazzMeIcons.close),
        onPressed: () async {
          httpService.deletePost(post.id);
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(post.title),
                ),
                ListTile(
                    subtitle: Text(
                  post.content,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
