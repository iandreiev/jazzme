import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanPage extends StatefulWidget {
  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  GlobalKey qrKey = GlobalKey();

  var qrText = "";

  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreate,
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                  children: qrText == null
                      ? <Widget>[Text("No data")]
                      : qrText == qrText
                          ? <Widget>[
                              Column(
                                children: <Widget>[
                                  Text("$qrText"),
                                  FlatButton(
                                    child: Text("Proceed"),
                                    onPressed: () {
                                      print("$qrText");
                                    },
                                  )
                                ],
                              )
                            ]
                          : []))
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreate(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        RegExp qrRegExp =
            new RegExp(r"\w+x", caseSensitive: false, multiLine: false);

        if (scanData == qrRegExp) {
          qrText = scanData;
        } else {
          qrText = "none";
        }
      });
    });
  }
}
