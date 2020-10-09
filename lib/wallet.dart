import 'package:flutter/material.dart';
import 'package:jazzme/bills.dart';
import 'package:jazzme/jazz_me_icons_icons.dart';
import 'package:jazzme/topup.dart';
import 'package:jazzme/transactions.dart';
import 'package:jazzme/transfer.dart';
import 'package:jazzme/withdraw.dart';
import 'UI/appbar.dart';
import 'UI/wallet_card.dart';
import 'UI/circle_button.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  List data;

  String tr;

  Future<String> getTransactions() async {
    var token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTIiLCJlbWFpbCI6ImFuZHJ2LmRldkBnbWFpbC5jb20iLCJtbmVtb25pYyI6Imtub2NrIGZpbmdlciBhdGhsZXRlIHNlbnNlIHB1cGlsIHRyYXNoIGJpcmQgZGVmeSBncml0IHNtaWxlIHNoYWRvdyByZWNpcGUiLCJ1c2VybmFtZSI6ImFuZHJleWV2IiwiYWRkcmVzcyI6Ik14YjJkYmQyODQ5NWJlYTVlYThjNTllNGIyODJlN2IzYjkxMjVlZGY5ZCIsImRlc2NyaXB0aW9uIjoiV2ViRGV2In0.3zrVKHbQqkuiL0eosDyRHrw-N5LZShY92x13Al2xWl0";

    var baseURL = "http://340305-ck48391.tmweb.ru/api/v2/";
    var trHistory = "tr/history";

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
    var sender = "Mxb2dbd28495bea5ea8c59e4b282e7b3b9125edf9d";

    return Scaffold(
        appBar: JazzBar(title: "Wallet"),
        body: Container(
          child: Column(
            children: <Widget>[
              WalletCard(
                address: "Mx0792a97c7cf2e99a67982b8209defc4094e31ac4",
                balance: "400 JAZZ",
                bipCourse: "0.029",
                usdCourse: "20",
              ),
              // Container(
              //   height: 32,
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  JazzCircleBTN(
                    splashColor: 0xFFF1F1F1,
                    fillColor: 0xFFFFFFFF,
                    iconColor: 0xFF42B937,
                    icon: JazzMeIcons.transfers,
                    semanticTitle: "Send",
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new TransfersPage()),
                      );
                    },
                  ),
                  JazzCircleBTN(
                    splashColor: 0xFFF1F1F1,
                    fillColor: 0xFFFFFFFF,
                    iconColor: 0xFF42B937,
                    icon: JazzMeIcons.post,
                    semanticTitle: "Withdraw",
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new WithdrawPage()),
                      );
                    },
                  ),
                  JazzCircleBTN(
                    splashColor: 0xFFF1F1F1,
                    fillColor: 0xFFFFFFFF,
                    iconColor: 0xFF42B937,
                    icon: JazzMeIcons.get_icon,
                    semanticTitle: "Top up",
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new TopUpPage()),
                      );
                    },
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 0),
                child: Column(
                  children: <Widget>[
                    ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        ListTile(
                            leading: Icon(Icons.timeline),
                            onTap: () {
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        new TransactionsPage()),
                              );
                            },
                            title: Text("Transaction history",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18.0,
                                    fontFamily: "TTCommons",
                                    fontWeight: FontWeight.w600))),
                        ListTile(
                            leading: Icon(Icons.payment),
                            onTap: () {
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new UserBills()),
                              );
                            },
                            title: Text("User bills",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18.0,
                                    fontFamily: "TTCommons",
                                    fontWeight: FontWeight.w600))),
                        ListTile(
                            leading: Icon(Icons.store),
                            title: Text("Store",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18.0,
                                    fontFamily: "TTCommons",
                                    fontWeight: FontWeight.w600))),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
