import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'UI/appbar.dart';
import 'package:http/http.dart' as http;
import 'package:jazzme/jazz_me_icons_icons.dart';
import 'article.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("http://340305-ck48391.tmweb.ru/api/v2/posts/"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: JazzBar(
          title: "Home",
        ),
        body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                  child: new Column(
                      children: data[index]["type"] == "0"
                          ? <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(data[index]["title"],
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 20.0,
                                          fontFamily: "TTCommons",
                                          fontWeight: FontWeight.w600)),
                                  IconButton(
                                    icon: new Icon(JazzMeIcons.ic_menu,
                                        size: 18.0),
                                    color: Colors.grey,
                                    onPressed: () {
                                      Scaffold.of(context)
                                          .showSnackBar(SnackBar(
                                        content: data[index]["id"],
                                      ));
                                    },
                                  )
                                ],
                              ),
                              Image(
                                  image: NetworkImage(
                                      'http://340305-ck48391.tmweb.ru/media/' +
                                          data[index]["file"]))
                            ]
                          : data[index]["type"] == "1"
                              ? <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          child: Text(data[index]["title"],
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600)),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      new PostsPage()),
                                            );
                                          }),
                                      IconButton(
                                        icon: new Icon(JazzMeIcons.ic_menu,
                                            size: 18.0),
                                        color: Colors.grey,
                                        onPressed: () {
                                          Scaffold.of(context)
                                              .showSnackBar(SnackBar(
                                            content: data[index]["id"],
                                          ));
                                        },
                                      )
                                    ],
                                  ),
                                ]
                              : [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(data[index]["title"],
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600)),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      new PostsPage()),
                                            );
                                          }),
                                      IconButton(
                                        icon: new Icon(JazzMeIcons.ic_menu),
                                        onPressed: () {
                                          print("ВЫЗВАН MENU ELSE!");
                                        },
                                      )
                                    ],
                                  ),
                                  Image(
                                      image: NetworkImage(
                                          'http://340305-ck48391.tmweb.ru/media/' +
                                              data[index]["file"]))
                                ]));
            }));
  }
}
