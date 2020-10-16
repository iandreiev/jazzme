import 'package:flutter/material.dart';
import 'package:jazzme/UI/Master/JazzBar.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JazzBar(title: "Wallet"),
      body: Container(
        child: Center(
          child: Text("Wallet"),
        ),
      ),
    );
  }
}
