import 'package:flutter/material.dart';
import 'package:jazzme/Getters/Get/getPosts.dart';
import 'package:jazzme/Models/Get/Posts.dart';
import 'package:jazzme/Pages/PostPage.dart';
import 'package:jazzme/UI/Master/JazzBar.dart';
import 'package:jazzme/UI/Slave/PostCard.dart';
// import 'package:jazzme/UI/Test/FrostedAppBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: JazzBar(
          title: "Home",
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFF42b937),
          child: Icon(Icons.add),
        ),
        body: FutureBuilder(
          future: httpService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Post> posts = snapshot.data;

              return new Column(
                children: <Widget>[
                  new Expanded(
                    child: new ListView(
                      children: posts
                          .map((Post post) => PostCard(
                                title: post.title,
                                content: post.content,
                                onTap: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                        builder: (context) => PostPage(
                                              post: post,
                                            ))),
                              ))
                          .toList(),
                    ),
                  )
                ],
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
