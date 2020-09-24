import 'package:flutter/material.dart';
import 'package:jazzme/UI/appbar.dart';
import 'package:jazzme/UI/button.dart';

class WithdrawPage extends StatefulWidget {
  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JazzBar(
        title: "Withdraw",
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
