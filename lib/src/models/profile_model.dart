//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
    Profile({
        this.id,
        this.image,
        this.nom,
        this.location,
        this.geo,
    });

    String id;
    String image;
    String nom;
    String location;
    String geo;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        image: json["image"],
        nom: json["nom"],
        location: json["location"],
        geo: json["geo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "nom": nom,
        "location": location,
        "geo": geo,
    };
}