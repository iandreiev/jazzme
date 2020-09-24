import 'package:flutter/material.dart';
import 'package:jazzme/auth.dart';
import 'UI/button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(children: <Widget>[
          Container(
            height: 200,
          ),
          Image.asset(
            'assets/jazzme-logo.png',
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          ),
          Container(
            height: 64,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Введите email",
            ),
          ),
          Container(
            height: 24,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Введите пароль",
            ),
          ),
          Container(
            height: 24,
          ),
          JazzBTN(
            title: "Войти",
            fillColor: 0xFF46C63A,
            splashColor: 0xFF42B937,
            textColor: 0xFFFFFFFF,
            onPressed: () {
              print("send");
            },
          ),
          Container(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new AuthPage()));
                },
                child: Text("Back"),
              ),
              FlatButton(
                onPressed: () {
                  print("Forgot pass");
                },
                child: Text("Forgot password"),
              )
            ],
          )
        ]),
      ),
    );
  }
}
