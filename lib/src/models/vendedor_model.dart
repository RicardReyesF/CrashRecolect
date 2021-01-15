// To parse this JSON data, do
//
//     final vendedorModel = vendedorModelFromJson(jsonString);

import 'dart:convert';

VendedorModel vendedorModelFromJson(String str) => VendedorModel.fromJson(json.decode(str));

String vendedorModelToJson(VendedorModel data) => json.encode(data.toJson());

class VendedorModel {
    VendedorModel({
        this.id,
        this.user,
        this.correo,
        this.password,
    });

    String id;
    String user;
    String correo;
    String password;

    factory VendedorModel.fromJson(Map<String, dynamic> json) => VendedorModel(
        id: json["id"],
        user: json["user"],
        correo: json["correo"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "correo": correo,
        "password": password,
    };
}