import 'package:flutter/material.dart';
import 'package:jazzme/http_service.dart';
import 'package:jazzme/Models/post.dart';
import 'UI/appbar.dart';
import 'article_detail.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JazzBar(
        title: "Test",
      ),
      body: FutureBuilder(
          future: httpService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Post> posts = snapshot.data;

              return ListView(
                children: posts
                    .map((Post post) => ListTile(
                          title: Text(post.title),
                          subtitle: Text(post.id.toString()),
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ArticleDetail(
                                        post: post,
                                      ))),
                        ))
                    .toList(),
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
