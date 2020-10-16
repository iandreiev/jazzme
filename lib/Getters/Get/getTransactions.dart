import 'dart:convert';
import 'package:http/http.dart';
import 'package:jazzme/Models/Get/Txs.dart';

class HttpService {
  final String baseURL = "http://340305-ck48391.tmweb.ru/api/v2/tr/history/web";
  final String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTIiLCJlbWFpbCI6ImFuZHJ2LmRldkBnbWFpbC5jb20iLCJtbmVtb25pYyI6Imtub2NrIGZpbmdlciBhdGhsZXRlIHNlbnNlIHB1cGlsIHRyYXNoIGJpcmQgZGVmeSBncml0IHNtaWxlIHNoYWRvdyByZWNpcGUiLCJ1c2VybmFtZSI6ImFuZHJleWV2IiwiYWRkcmVzcyI6Ik14YjJkYmQyODQ5NWJlYTVlYThjNTllNGIyODJlN2IzYjkxMjVlZGY5ZCIsImRlc2NyaXB0aW9uIjoiV2ViRGV2In0.3zrVKHbQqkuiL0eosDyRHrw-N5LZShY92x13Al2xWl0";

  Future<List<Tx>> getTx() async {
    Response res = await get(baseURL, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });
    print(res.statusCode);

    if (res.statusCode == 200) {
      print(res.body);

      List<dynamic> body = jsonDecode(res.body);
      List<Tx> txs = body.map((dynamic item) => Tx.fromJson(item)).toList();

      return txs;
    } else {
      throw "Can't get transactions history";
    }
  }
}
