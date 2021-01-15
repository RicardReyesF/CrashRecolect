// To parse this JSON data, do
//
//     final compradorModel = compradorModelFromJson(jsonString);

import 'dart:convert';

CompradorModel compradorModelFromJson(String str) => CompradorModel.fromJson(json.decode(str));

String compradorModelToJson(CompradorModel data) => json.encode(data.toJson());

class CompradorModel {
    CompradorModel({
        this.id,
        this.user,
        this.correo,
        this.password,
    });

    String id;
    String user;
    String correo;
    String password;

    factory CompradorModel.fromJson(Map<String, dynamic> json) => CompradorModel(
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
