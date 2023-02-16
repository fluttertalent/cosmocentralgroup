
// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.success,
  });

  Success? success;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: Success.fromJson(json["success"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success!.toJson(),
  };
}

class Success {
  Success({
    this.token,
    this.id,
    this.name,
  });

  String? token;
  int? id;
  String? name;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
    token: json["token"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "id": id,
    "name": name,
  };
}
