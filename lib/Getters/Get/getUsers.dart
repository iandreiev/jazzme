import 'dart:convert';
import 'package:http/http.dart';
import 'package:jazzme/Models/Get/Users.dart';

class HttpService {
  final String baseURL = "http://340305-ck48391.tmweb.ru/api/v2/users";

  Future<List<User>> getUsers() async {
    Response res = await get(baseURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<User> users =
          body.map((dynamic item) => User.fromJson(item)).toList();
      return users;
    } else {
      throw "Can't get users";
    }
  }
}
