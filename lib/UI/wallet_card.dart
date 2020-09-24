import 'package:flutter/material.dart';
import 'package:jazzme/jazz_me_icons_icons.dart';

class WalletCard extends StatelessWidget {
  String address;
  String balance;
  String bipCourse;
  String usdCourse;

  WalletCard({this.address, this.balance, this.bipCourse, this.usdCourse})
      : assert(address != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      margin: EdgeInsets.all(24.0),
      color: Color(0xFF46C63A),
      child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(12.0),
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Column(
            children: <Widget>[
              Container(
                height: 12,
              ),
              Text(address,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontFamily: "TTCommons",
                    fontSize: 14.0,
                  )),
              Container(
                height: 32,
              ),
              Text(balance,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontFamily: "TTCommons",
                    fontWeight: FontWeight.w600,
                    fontSize: 28.0,
                  )),
              Container(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "1 BIP/USD " + bipCourse,
                    style: TextStyle(
                        color: Colors.white60,
                        fontFamily: "TTCommons",
                        fontSize: 14),
                  ),
                  Text(
                    "1 BIP = " + usdCourse + " JAZZ",
                    style: TextStyle(
                        color: Colors.white60,
                        fontFamily: "TTCommons",
                        fontSize: 14),
                  )
                ],
              ),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new IconButton(
                        icon: new Icon(JazzMeIcons.ic_qr,
                            color: Color(0xFFFFFFFF)),
                        onPressed: () {
                          print("ВЫЗВАН QR!");
                        },
                      ),
                      new IconButton(
                        icon: new Icon(JazzMeIcons.ic_cp__white,
                            color: Color(0xFFFFFFFF)),
                        onPressed: () {
                          print("ВЫЗВАН Copy!");
                        },
                      ),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
