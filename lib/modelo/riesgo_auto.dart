// To parse this JSON data, do
//
//     final riesgoAutoModel = riesgoAutoModelFromJson(jsonString);

import 'dart:convert';

RiesgoAutoModel riesgoAutoModelFromJson(String str) => RiesgoAutoModel.fromJson(json.decode(str));

String riesgoAutoModelToJson(RiesgoAutoModel data) => json.encode(data.toJson());

class RiesgoAutoModel {
    int idCia;
    int idPoliza;
    int idItem;
    int nroItem;
    String marca;
    String modelo;
    int anio;
    String placa;
    String motor;
    String chasis;
    int idAsegurado;

    RiesgoAutoModel({
        this.idCia,
        this.idPoliza,
        this.idItem,
        this.nroItem,
        this.marca,
        this.modelo,
        this.anio,
        this.placa,
        this.motor,
        this.chasis,
        this.idAsegurado,
    });

    factory RiesgoAutoModel.fromJson(Map<String, dynamic> json) => RiesgoAutoModel(
        idCia: json["idCia"],
        idPoliza: json["idPoliza"],
        idItem: json["idItem"],
        nroItem: json["nroItem"],
        marca: json["marca"],
        modelo: json["modelo"],
        anio: json["anio"],
        placa: json["placa"],
        motor: json["motor"],
        chasis: json["chasis"],
        idAsegurado: json["idAsegurado"],
    );

    Map<String, dynamic> toJson() => {
        "idCia": idCia,
        "idPoliza": idPoliza,
        "idItem": idItem,
        "nroItem": nroItem,
        "marca": marca,
        "modelo": modelo,
        "anio": anio,
        "placa": placa,
        "motor": motor,
        "chasis": chasis,
        "idAsegurado": idAsegurado,
    };
}



class RiesgoAutos {
  List<RiesgoAutoModel> items = new List<RiesgoAutoModel>();

  RiesgoAutos();
  RiesgoAutos.fromJsonList( List<dynamic> jsonList  ) { 
    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final RiesgoAutoModel riesgoAuto = new RiesgoAutoModel.fromJson(item);
      items.add( riesgoAuto );
    }
   }


 RiesgoAutos.fromMapa( Map<String, dynamic> mapa  ) { 
    if ( mapa == null ) return ;

    mapa.forEach((id,pol) {
      final RiesgoAutoModel riesgoAuto = new RiesgoAutoModel.fromJson(pol);
      //riesgoauto.idPoliza = id; 
      items.add( riesgoAuto );
    });
    
   }


}



