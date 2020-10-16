class User {
  final String name;
  final String username;
  final String photo;
  final String typeInt;
  final String type;
  final String address;

  User(
      {this.name,
      this.username,
      this.photo,
      this.typeInt,
      this.address,
      this.type});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'] as String,
        username: json['username'] as String,
        photo: json['photo'] as String,
        typeInt: json['type_int'] as String,
        type: json['type'] as String,
        address: json['address'] as String);
  }
}
