import 'package:flutter/material.dart';
import 'auth.dart';
import 'dart:async';

// import 'UI/appbar.dart';
void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AuthPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/jazzme-logo.png',
          height: 100,
          width: 100,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
