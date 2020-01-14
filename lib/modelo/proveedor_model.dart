// To parse this JSON data, do
//
//     final proveedorModel = proveedorModelFromJson(jsonString);

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

ProveedorModel proveedorModelFromJson(String str) => ProveedorModel.fromJson(json.decode(str));

String proveedorModelToJson(ProveedorModel data) => json.encode(data.toJson());

class ProveedorModel {
    int idproveedor;
    String proveedor;
    String direccion;
    String descripcion;
    String celular;
    String telefono;
    String correo;
    double lat;
    double lon;

    ProveedorModel({
        this.idproveedor,
        this.proveedor,
        this.direccion,
        this.descripcion,
        this.celular,
        this.telefono,
        this.correo,
        this.lat,
        this.lon,
    });

    factory ProveedorModel.fromJson(Map<String, dynamic> json) => ProveedorModel(
        idproveedor: json["idproveedor"],
        proveedor: json["proveedor"],
        direccion: json["direccion"],
        descripcion: json["descripcion"],
        celular: json["celular"],
        telefono: json["telefono"],
        correo: json["correo"],
        lat: json["lat"],
        lon: json["lon"],
    );

    Map<String, dynamic> toJson() => {
        "idproveedor": idproveedor,
        "proveedor": proveedor,
        "direccion": direccion,
        "descripcion": descripcion,
        "celular": celular,
        "telefono": telefono,
        "correo": correo,
        "lat": lat,
        "lon": lon,
    };
}


class ProveedoresModel {
  List<ProveedorModel> items = new List<ProveedorModel>();
  

  ProveedoresModel();
  ProveedoresModel.fromJsonList( List<dynamic> jsonList  ) { 
    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final ProveedorModel proveedormodel = new ProveedorModel.fromJson(item);
      items.add( proveedormodel );
    }
   }


 ProveedoresModel.fromMapa( Map<String, dynamic> mapa  ) { 
    if ( mapa == null ) return ;

    mapa.forEach((id,pol) {
      final ProveedorModel proveedormodel = new ProveedorModel.fromJson(pol);
      items.add( proveedormodel );

    });
    
   }




  


}


