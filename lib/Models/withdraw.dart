import 'dart:convert';

Withdraw withdrawFromJson(String str) => Withdraw.fromJson(json.decode(str));

String withdrawToJson(Withdraw data) => json.encode(data.toJson());

class Withdraw {
  Withdraw({
    this.email,
    this.exchangeTo,
    this.paymentUrl,
    this.cancelUrl,
    this.appname,
    this.iconUrl,
    this.username,
    this.amount,
    this.currency,
    this.credentials,
    this.test,
  });

  String email;
  String exchangeTo;
  String paymentUrl;
  String cancelUrl;
  String appname;
  String iconUrl;
  String username;
  int amount;
  String currency;
  String credentials;
  bool test;

  factory Withdraw.fromJson(Map<String, dynamic> json) => Withdraw(
        email: json["email"],
        exchangeTo: json["exchange_to"],
        paymentUrl: json["payment_url"],
        cancelUrl: json["cancel_url"],
        appname: json["appname"],
        iconUrl: json["icon_url"],
        username: json["username"],
        amount: json["amount"],
        currency: json["currency"],
        credentials: json["credentials"],
        test: json["test"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "exchange_to": exchangeTo,
        "payment_url": paymentUrl,
        "cancel_url": cancelUrl,
        "appname": appname,
        "icon_url": iconUrl,
        "username": username,
        "amount": amount,
        "currency": currency,
        "credentials": credentials,
        "test": test,
      };
}
