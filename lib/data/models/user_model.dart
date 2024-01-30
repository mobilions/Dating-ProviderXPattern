// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? idUser;
  String? username;
  String? passwd;
  String? firstname;
  String? lastname;
  dynamic telefono;
  String? email;
  String? active;
  String? type;
  String? countryCode;
  dynamic authLvl;
  dynamic buId;

  UserModel({
    this.idUser,
    this.username,
    this.passwd,
    this.firstname,
    this.lastname,
    this.telefono,
    this.email,
    this.active,
    this.type,
    this.countryCode,
    this.authLvl,
    this.buId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idUser: json["id_user"],
        username: json["username"],
        passwd: json["passwd"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        telefono: json["telefono"],
        email: json["email"],
        active: json["active"],
        type: json["type"],
        countryCode: json["country_code"],
        authLvl: json["auth_lvl"],
        buId: json["bu_id"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "username": username,
        "passwd": passwd,
        "firstname": firstname,
        "lastname": lastname,
        "telefono": telefono,
        "email": email,
        "active": active,
        "type": type,
        "country_code": countryCode,
        "auth_lvl": authLvl,
        "bu_id": buId,
      };
}
