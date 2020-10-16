import 'dart:convert';
import 'package:http/http.dart';
import 'package:jazzme/Models/Get/Posts.dart';

class HttpService {
  final String baseURL = "http://340305-ck48391.tmweb.ru/api/v2/posts/web/";
  final String fbURL = "https://jazzdbtest.web.app/api/posts";
  final String test = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts() async {
    Response res = await get(baseURL);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    } else {
      throw "Can't get posts";
    }
  }
}
