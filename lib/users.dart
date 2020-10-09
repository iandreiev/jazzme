import "package:flutter/material.dart";
import 'dart:async';
import 'dart:convert';
import 'UI/appbar.dart';
import 'package:http/http.dart' as http;

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List data;

  Future<String> getUsers() async {
    var response = await http.get(
        Uri.encodeFull("http://340305-ck48391.tmweb.ru/api/v2/users"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });

    return "Success";
  }

  @override
  void initState() {
    super.initState();
    this.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JazzBar(title: "Users"),
      body: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                child: new Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data[index]["name"],
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.0,
                              fontFamily: "TTCommons",
                              fontWeight: FontWeight.w400),
                        ),
                        IconButton(
                          icon: new Icon(Icons.person_add),
                          onPressed: () {
                            print(data[index]["name"]);

                            // Navigator.push(
                            //   context,
                            //   new MaterialPageRoute(
                            //       builder: (context) => new UsersPage()
                            //       ),
                            // );
                          },
                        ),
                      ],
                    )
                  ],
                ));
          }),
    );
  }
}
