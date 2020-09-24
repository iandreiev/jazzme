import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jazzme/login.dart';
import 'UI/button.dart';
// import 'dart:async';

import 'home.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    // Only taking the first part of the name, i.e., First Name
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out");
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Column(children: <Widget>[
              Image.asset(
                'assets/jazzme-logo.png',
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              ),
              Container(
                height: 24,
              ),
              Text(
                "JAZZME",
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: "TTCommons",
                    fontWeight: FontWeight.w800,
                    fontSize: 24.0),
              ),
              Container(
                height: 96,
              ),
              Row(
                children: <Widget>[
                  JazzBTN(
                    title: "Вход",
                    fillColor: 0xFF46C63A,
                    splashColor: 0xFF42B937,
                    textColor: 0xFFFFFFFF,
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new HomePage()),
                      );
                    },
                  ),
                  Container(
                    width: 24,
                  ),
                  JazzBTN(
                    title: "Регистрация",
                    fillColor: 0xFFFFFFFF,
                    splashColor: 0xFFF1F1F1,
                    textColor: 0xFF46C63A,
                    onPressed: () {
                      // signInWithGoogle().then((result) {
                      //   if (result != null) {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) {
                      //         return HomePage();
                      //       },
                      //     ));
                      //   }
                      // });
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new LoginPage()),
                      );
                    },
                  ),
                ],
              ),
            ])
          ])
        ]));
  }
}
