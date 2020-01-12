import 'package:appdosinteligente/util/tiempo.dart';


// To parse this JSON data, do
//
//     final notificacionModel = notificacionModelFromJson(jsonString);

import 'dart:convert';

NotificacionModel notificacionModelFromJson(String str) => NotificacionModel.fromJson(json.decode(str));

String notificacionModelToJson(NotificacionModel data) => json.encode(data.toJson());

class NotificacionModel {
    int idnotificacion=0;
    String titulo="";
    String cuerpo="";
    String fecha = getFechaActual();
    String descripcion="";
    String pagina="";

    NotificacionModel({
        this.idnotificacion,
        this.titulo,
        this.cuerpo,
        this.fecha,
        this.descripcion,
        this.pagina,
    });

    factory NotificacionModel.fromJson(Map<String, dynamic> json) => NotificacionModel(
        idnotificacion: json["idnotificacion"],
        titulo: json["titulo"],
        cuerpo: json["cuerpo"],
        fecha: json["fecha"],
        descripcion: json["descripcion"],
        pagina: json["pagina"],
    );

    Map<String, dynamic> toJson() => {
        // "idnotificacion": idnotificacion,
        "titulo": titulo,
        "cuerpo": cuerpo,
        "fecha": fecha,
        "descripcion": descripcion,
        "pagina": pagina,
    };
}
