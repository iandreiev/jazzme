class Tx {
  final String sender;
  final String senderName;
  final String senderAddress;
  final String reciever;
  final String recieverAddress;
  final String recieverName;
  final String coin;
  final int comission;
  final int value;
  final String hash;
  final String createdAt;

  Tx(
      {this.sender,
      this.senderName,
      this.senderAddress,
      this.reciever,
      this.recieverAddress,
      this.recieverName,
      this.coin,
      this.comission,
      this.value,
      this.hash,
      this.createdAt});

  factory Tx.fromJson(Map<String, dynamic> json) {
    return Tx(
        sender: json['sender'] as String,
        senderAddress: json['sender_address'] as String,
        senderName: json['sender_name'] as String,
        reciever: json['reciever'] as String,
        recieverAddress: json['reciever_address'] as String,
        recieverName: json['reciever_name'] as String,
        coin: json['coin'] as String,
        comission: json['comission'] as int,
        value: json['value'] as int,
        hash: json['hash'] as String,
        createdAt: json['created_at'] as String);
  }
}
