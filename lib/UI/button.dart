import 'package:flutter/material.dart';

class JazzBTN extends StatelessWidget {
  String title;
  int fillColor;
  int splashColor;
  int textColor;

  JazzBTN(
      {this.title,
      this.fillColor,
      this.textColor,
      this.splashColor,
      @required this.onPressed})
      : assert(title != null);

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(fillColor),
      splashColor: Color(splashColor),
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 14, 24, 14),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(textColor),
                    fontFamily: "TTCommons",
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600))
          ],
        ),
      ),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    );
  }
}
