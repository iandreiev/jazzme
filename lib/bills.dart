import 'package:flutter/material.dart';
import 'package:jazzme/UI/appbar.dart';
import 'package:jazzme/UI/bill_card.dart';

class UserBills extends StatefulWidget {
  @override
  _UserBillsState createState() => _UserBillsState();
}

class _UserBillsState extends State<UserBills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JazzBar(
        title: "Bills",
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            BillCard(balance: "400", ticker: "BIP"),
            BillCard(balance: "123400", ticker: "BNTJAZZ"),
            BillCard(balance: "400", ticker: "POPE"),
          ],
        ),
      ),
    );
  }
}
