import 'package:flutter/material.dart';

class JazzCircleBTN extends StatelessWidget {
  IconData icon;
  int fillColor;
  int iconColor;
  int splashColor;
  String semanticTitle;

  JazzCircleBTN(
      {this.icon,
      this.fillColor,
      this.splashColor,
      this.iconColor,
      this.semanticTitle,
      @required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RawMaterialButton(
            onPressed: onPressed,
            fillColor: Color(fillColor),
            splashColor: Color(splashColor),
            constraints: BoxConstraints.tightFor(height: 64, width: 64),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
            child: Icon(
              icon,
              color: Color(iconColor),
              size: 20,
            ),
          ),
          Container(
            height: 12,
          ),
          Text(
            semanticTitle,
            style: TextStyle(
                color: Color(0xFF696969),
                fontFamily: "TTCommons",
                fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
