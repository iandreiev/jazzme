import 'package:flutter/material.dart';

class BillCard extends StatelessWidget {
  String balance;
  String ticker;

  BillCard({this.balance, this.ticker}) : assert(balance != null);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: EdgeInsets.fromLTRB(24, 12, 24, 12),
        color: Color(0xFFFFFFFF),
        child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.fromLTRB(24, 32, 24, 24),
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${ticker}",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "TTCommons",
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF696969)),
                ),
                Text(
                  "${balance} ${ticker}",
                  style: TextStyle(
                      fontFamily: "TTCommons",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF46C63A)),
                )
              ],
            )));
  }
}
