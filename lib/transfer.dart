import 'package:flutter/material.dart';
import 'package:jazzme/UI/appbar.dart';
import 'package:jazzme/UI/button.dart';
import 'package:http/http.dart' as http;
import 'Models/withdraw.dart';

class TransfersPage extends StatefulWidget {
  @override
  _TransfersPageState createState() => _TransfersPageState();
}

Future<Withdraw> createTransfer(String email, String exchangeTo,
    String username, int amount, String currency, String credentials) async {
  final String apiUrl = "https://jazzdbtest.web.app/api/withdraws";

  final response = await http.post(apiUrl, body: {
    "email": email,
    "exchangeTo": exchangeTo,
    "username": username,
    "amount": amount,
    "currency": currency,
    "credentials": credentials
  });

  if (response.statusCode == 200) {
    final String responseString = response.body;

    return withdrawFromJson(responseString);
  } else {
    return null;
  }
}

class _TransfersPageState extends State<TransfersPage> {
  Withdraw _tx;

  final TextEditingController summController = TextEditingController();
  final TextEditingController curController = TextEditingController();
  final TextEditingController methodController = TextEditingController();
  final TextEditingController billController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JazzBar(
        title: "Send",
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(children: <Widget>[
          TextFormField(
            controller: summController,
            decoration: InputDecoration(hintText: "Введите сумму"),
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: curController,
            decoration: InputDecoration(hintText: "Выберите валюту"),
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: methodController,
            decoration: InputDecoration(hintText: "Выберите направление"),
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: billController,
            decoration: InputDecoration(hintText: "Ввведите реквизиты"),
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(hintText: "Ввведите E-mail"),
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(hintText: "Ввведите юзернейм"),
          ),
          SizedBox(
            height: 24,
          ),
          JazzBTN(
            title: "Send",
            fillColor: 0xFF46C63A,
            splashColor: 0xFF42B937,
            textColor: 0xFFFFFFFF,
            onPressed: () async {
              final String email = emailController.text;
              final String exchangeTo = methodController.text;
              final String currency = curController.text;
              final String credentials = billController.text;
              final String username = usernameController.text;
              final int amount = int.tryParse(summController.text);

              final Withdraw tx = await createTransfer(
                  email, exchangeTo, username, amount, currency, credentials);

              setState(() {
                _tx = tx;
              });
            },
          ),
          SizedBox(
            height: 32,
          ),
          _tx == null
              ? Text("Error caused")
              : Text(
                  "The user ${_tx.username} proceed ${_tx.amount} ${_tx.currency} to ${_tx.exchangeTo}")
        ]),
      ),
    );
  }
}
