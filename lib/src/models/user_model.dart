import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.id,
        this.nom,
        this.correo,
        this.password,
        this.role,
    });

    String id;
    String nom;
    String correo;
    String password;
    String role;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        nom: json["nom"],
        correo: json["correo"],
        password: json["password"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "correo": correo,
        "password": password,
        "role": role,
    };
}