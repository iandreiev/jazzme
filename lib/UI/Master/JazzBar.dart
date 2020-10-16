import 'package:flutter/material.dart';
// import 'package:jazzme/Pages/TransactionsPage.dart';
import 'package:jazzme/Pages/UserProfilePage.dart';
import 'package:jazzme/Pages/UsersPage.dart';
import 'package:jazzme/Pages/WalletPage.dart';

class JazzBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 100.0;
  final String title;
  final bool actions;

  JazzBar({this.title, this.actions}) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _preferredHeight,
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.fromLTRB(12, 48, 12, 10),
      decoration: BoxDecoration(color: Colors.white24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
              children: actions == true
                  ? [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 24,
                          ),
                          onPressed: () => Navigator.pop(context)),
                      Text(title,
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: "TTCommons",
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700))
                    ]
                  : [
                      Text(title,
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: "TTCommons",
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700))
                    ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.account_balance_wallet),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new WalletPage()));
                  }),
              IconButton(
                  icon: Icon(Icons.group),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new UsersPage()));
                  }),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new UserProfilePage()),
                  );
                },
                child: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text("IA",
                        style: TextStyle(fontWeight: FontWeight.w600))),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}
