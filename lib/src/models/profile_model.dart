//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  LatLng getLonLat(){
    if(geo != null){

      final lonlat=geo.split(",");
        final lat=double.parse(lonlat[0]);
        final long =double.parse(lonlat[1]);
        return LatLng(lat,long);
    
    }else{

        final double lat=19.0015415;
        final double long=-91.51551;
        return LatLng(lat,long);
    }
  }
}