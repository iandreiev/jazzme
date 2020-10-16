import 'package:flutter/material.dart';

import 'Pages/HomePage.dart';

void main() => runApp(MaterialApp(
      home: AuthPage(),
      debugShowCheckedModeBanner: false,
    ));

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
