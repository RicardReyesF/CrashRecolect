import 'dart:convert';

NotificacionesModel notificacionesModelFromJson(String str) => NotificacionesModel.fromJson(json.decode(str));

String notificacionesModelToJson(NotificacionesModel data) => json.encode(data.toJson());

class NotificacionesModel {
    NotificacionesModel({
        this.id,
        this.status,
        this.mensaje,
        this.geo,
        this.uID,
    });

    String id;
    String status;
    String mensaje;
    String geo;
    String uID;

    factory NotificacionesModel.fromJson(Map<String, dynamic> json) => NotificacionesModel(
        id: json["id"],
        status: json["status"],
        mensaje: json["mensaje"],
        geo: json["geo"],
        uID: json["uID"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "mensaje": mensaje,
        "geo": geo,
        "uID": uID
    };
}