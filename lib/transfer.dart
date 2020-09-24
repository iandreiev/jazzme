import 'package:flutter/material.dart';
import 'package:jazzme/UI/appbar.dart';
import 'package:jazzme/UI/button.dart';

class TransfersPage extends StatefulWidget {
  @override
  _TransfersPageState createState() => _TransfersPageState();
}

class _TransfersPageState extends State<TransfersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JazzBar(
        title: "Send money",
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(children: <Widget>[
          TextFormField(),
          TextFormField(),
          Text("Summ"),
          JazzBTN(
            title: "Send",
            fillColor: 0xFF46C63A,
            splashColor: 0xFF42B937,
            textColor: 0xFFFFFFFF,
            onPressed: () {
              print("send");
            },
          ),
        ]),
      ),
    );
  }
}
