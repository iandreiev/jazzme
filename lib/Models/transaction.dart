class Transaction {
  final String sender;
  final String sender_name;
  final String sender_address;
  final String reciever;
  final String reciever_address;
  final String reciever_name;
  final String coin;
  final int comission;
  final int value;
  final String hash;
  final String created_at;

  Transaction(
      {this.sender,
      this.sender_name,
      this.sender_address,
      this.reciever,
      this.reciever_address,
      this.reciever_name,
      this.coin,
      this.comission,
      this.value,
      this.hash,
      this.created_at});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        sender: json['sender'] as String,
        sender_address: json['sender_address'] as String,
        sender_name: json['sender_name'] as String,
        reciever: json['reciever'] as String,
        reciever_address: json['reciever_address'] as String,
        reciever_name: json['reciever_name'] as String,
        coin: json['coin'] as String,
        comission: json['comission'] as int,
        value: json['value'] as int,
        hash: json['hash'] as String,
        created_at: json['created_at'] as String);
  }
}
