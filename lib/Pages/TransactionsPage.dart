import 'package:flutter/material.dart';
import 'package:jazzme/Getters/Get/getTransactions.dart';
import 'package:jazzme/Models/Get/Txs.dart';
import 'package:jazzme/UI/Master/JazzBar.dart';
import 'package:jazzme/UI/Slave/TxItem.dart';

class TransactionsPage extends StatefulWidget {
  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JazzBar(
        title: "Bill history",
      ),
      body: FutureBuilder(
        future: httpService.getTx(),
        builder: (BuildContext context, AsyncSnapshot<List<Tx>> snapshot) {
          if (snapshot.hasData) {
            List<Tx> txs = snapshot.data;

            return new Column(
              children: <Widget>[
                new ListView(
                  children: txs
                      .map((Tx tx) => TxItem(
                            onTap: () {},
                            coin: tx.coin,
                            createdAt: tx.createdAt,
                            hash: tx.hash,
                            value: tx.value as String,
                          ))
                      .toList(),
                ),
              ],
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
