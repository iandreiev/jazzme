import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jazzme/UI/appbar.dart';

class TransactionsPage extends StatefulWidget {
  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  List data;

  String tr;

  Future<String> getTransactions() async {
    var token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTIiLCJlbWFpbCI6ImFuZHJ2LmRldkBnbWFpbC5jb20iLCJtbmVtb25pYyI6Imtub2NrIGZpbmdlciBhdGhsZXRlIHNlbnNlIHB1cGlsIHRyYXNoIGJpcmQgZGVmeSBncml0IHNtaWxlIHNoYWRvdyByZWNpcGUiLCJ1c2VybmFtZSI6ImFuZHJleWV2IiwiYWRkcmVzcyI6Ik14YjJkYmQyODQ5NWJlYTVlYThjNTllNGIyODJlN2IzYjkxMjVlZGY5ZCIsImRlc2NyaXB0aW9uIjoiV2ViRGV2In0.3zrVKHbQqkuiL0eosDyRHrw-N5LZShY92x13Al2xWl0";

    var baseURL = "http://340305-ck48391.tmweb.ru/api/v2/";
    var trHistory = "tr/history/web";

    var response = await http.get(Uri.encodeFull(baseURL + trHistory),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });

    print(response.body);

    this.setState(() {
      data = json.decode(response.body);

      print(data[0]["sender"]);
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    var sender = "andreyev";

    return Scaffold(
      appBar: JazzBar(
        title: "History",
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
              child: new Column(
                  children: data[index]["sender"] == "12"
                      ? [
                          ListTile(
                            leading: Icon(
                              Icons.arrow_back,
                              color: Colors.red,
                            ),
                            title: Text(data[index]["value"] +
                                " " +
                                data[index]["coin"]),
                            subtitle: Text(data[index]["created_at"]),
                          )
                        ]
                      : [
                          ListTile(
                            leading:
                                Icon(Icons.arrow_forward, color: Colors.green),
                            title: Text(data[index]["value"] +
                                " " +
                                data[index]["coin"]),
                            subtitle: Text(data[index]["created_at"]),
                          )
                        ]),
            );
          }),
    );
  }
}
