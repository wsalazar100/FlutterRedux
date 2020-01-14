
// To parse this JSON data, do
//
//     final ubicacionModel = ubicacionModelFromJson(jsonString);

import 'dart:convert';

import 'package:location/location.dart';

UbicacionModel ubicacionModelFromJson(String str) => UbicacionModel.fromJson(json.decode(str));

String ubicacionModelToJson(UbicacionModel data) => json.encode(data.toJson());

class UbicacionModel {
    int idubicacion;
    double lat;
    double lon;
    String direccion;
    String descripcion;
    String pagina;

    UbicacionModel({
        this.idubicacion,
        this.lat,
        this.lon,
        this.direccion,
        this.descripcion,
        this.pagina,
    });

    factory UbicacionModel.fromLocation(LocationData location) => UbicacionModel(
        lat: location.latitude,
        lon: location.longitude
    );

    factory UbicacionModel.fromJson(Map<String, dynamic> json) => UbicacionModel(
        idubicacion: json["idubicacion"],
        lat: json["lat"],
        lon: json["lon"],
        direccion: json["direccion"],
        descripcion: json["descripcion"],
        pagina: json["pagina"],
    );

    Map<String, dynamic> toJson() => {
        "idubicacion": idubicacion,
        "lat": lat,
        "lon": lon,
        "direccion": direccion,
        "descripcion": descripcion,
        "pagina": pagina,
    };
}

  
