import 'dart:convert';


class LoginResponse {
  String token;
  User user;

  LoginResponse({
    required this.token,
    required this.user,
  });

  static LoginResponse fromRawJson(String str) => LoginResponse.fromJson(json.decode(str));

  static String toRawJson(LoginResponse data) => json.encode(data.toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  int id;
  String fullName;
  String email;
  bool resetPassword;
  dynamic store;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.resetPassword,
    this.store,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fullName: json["fullName"],
    email: json["email"],
    resetPassword: json["resetPassword"],
    store: json["store"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "email": email,
    "resetPassword": resetPassword,
    "store": store,
  };
}
