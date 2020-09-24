import 'package:flutter/material.dart';
import 'package:jazzme/jazz_me_icons_icons.dart';
import '../wallet.dart';
import '../home.dart';
import '../qrscanner.dart';

class JazzBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 100.0;

  String title;
  Color color;

  JazzBar({this.title, this.color}) : assert(title != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _preferredHeight,
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.fromLTRB(24.0, 48.0, 24.0, 10.0),
      decoration: BoxDecoration(color: Colors.white24),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title,
            style: TextStyle(
                color: Colors.black87,
                fontFamily: "TTCommons",
                fontSize: 30.0,
                fontWeight: FontWeight.w700)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new IconButton(
              icon: new Icon(JazzMeIcons.whatshot),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new HomePage()),
                );
              },
            ),
            new IconButton(
              icon: new Icon(JazzMeIcons.ic_qr),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new QRScanPage()),
                );
                print("QR");
              },
            ),
            new IconButton(
              icon: new Icon(JazzMeIcons.ic_wallet),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new WalletPage()),
                );
              },
            ),
            new CircleAvatar(
                backgroundColor: Colors.purple,
                child:
                    Text("IA", style: TextStyle(fontWeight: FontWeight.w600)))
          ],
        ),
      ]),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}
