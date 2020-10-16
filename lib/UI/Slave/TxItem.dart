import 'package:flutter/material.dart';

class TxItem extends StatelessWidget {
  final String hash;
  final String value;
  final String coin;
  final String createdAt;

  TxItem(
      {this.coin, this.createdAt, this.hash, this.value, @required this.onTap})
      : assert(hash != null);

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: onTap,
            child: ListTile(
              title: Text("$value $coin"),
              subtitle: Text(hash),
            ),
          )
        ],
      ),
    );
  }
}
