import 'Models/post.dart';
// import 'Models/transaction.dart';
import 'dart:convert';
import 'package:http/http.dart';

class HttpService {
  final String transactURL =
      "http://340305-ck48391.tmweb.ru/api/v2/tr/history/web";
  final String jPostsUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<void> deletePost(int id) async {
    Response res = await delete("$jPostsUrl/$id");

    if (res.statusCode == 200) {
      print("Deleted");
    }
  }

  // Future<List<Transaction>> getTransaction() async {
  //   Response res = await get(transactURL);
  // }

  Future<List<Post>> getPosts() async {
    Response res = await get(jPostsUrl);

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
