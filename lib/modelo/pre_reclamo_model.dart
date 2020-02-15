// To parse this JSON data, do
//
//     final preReclamoModel = preReclamoModelFromJson(jsonString);

import 'dart:convert';

PreReclamoModel preReclamoModelFromJson(String str) => PreReclamoModel.fromJson(json.decode(str));

String preReclamoModelToJson(PreReclamoModel data) => json.encode(data.toJson());

class PreReclamoModel {
    int idCia;
    int idPoliza;
    int idItem;
    int idAmparo;
    int idCausa;
    int idPreReclamo;
    String nroPreReclamo;
    String accidente;
    String fecAccidente;
    int idPais;
    int idProvincia;
    int idCiudad;
    String lugarAccidente;

    PreReclamoModel({
        this.idCia,
        this.idPoliza,
        this.idItem,
        this.idAmparo,
        this.idCausa,
        this.idPreReclamo,
        this.nroPreReclamo,
        this.accidente,
        this.fecAccidente,
        this.idPais,
        this.idProvincia,
        this.idCiudad,
        this.lugarAccidente,
    });

    factory PreReclamoModel.fromJson(Map<String, dynamic> json) => PreReclamoModel(
        idCia: json["idCia"],
        idPoliza: json["idPoliza"],
        idItem: json["idItem"],
        idAmparo: json["idAmparo"],
        idCausa: json["idCausa"],
        idPreReclamo: json["idPreReclamo"],
        nroPreReclamo: json["nroPreReclamo"],
        accidente: json["accidente"],
        fecAccidente: json["fecAccidente"],
        idPais: json["idPais"],
        idProvincia: json["idProvincia"],
        idCiudad: json["idCiudad"],
        lugarAccidente: json["lugarAccidente"],
    );

    Map<String, dynamic> toJson() => {
        "idCia": idCia,
        "idPoliza": idPoliza,
        "idItem": idItem,
        "idAmparo": idAmparo,
        "idCausa": idCausa,
        "idPreReclamo": idPreReclamo,
        "nroPreReclamo": nroPreReclamo,
        "accidente": accidente,
        "fecAccidente": fecAccidente,
        "idPais": idPais,
        "idProvincia": idProvincia,
        "idCiudad": idCiudad,
        "lugarAccidente": lugarAccidente,
    };

    Map<String, dynamic> toJson2() => {
        "idCia": '"' + idCia.toString() + '"',
        "idPoliza": "'" + idPoliza.toString() + "'",
        "idItem": "'" + idItem.toString() + "'",
        "idAmparo": "'" + idAmparo.toString() + "'",
        "idCausa": "'" + idCausa.toString() + "'",
        "idPreReclamo": "'" + idPreReclamo.toString() + "'",
        "nroPreReclamo": nroPreReclamo,
        "accidente": accidente,
        "fecAccidente": fecAccidente,
        "idPais": "'" + idPais.toString() + "'",
        "idProvincia": "'" + idProvincia.toString() + "'",
        "idCiudad": "'" + idCiudad.toString() + "'",
        "lugarAccidente": lugarAccidente,
    };

    
    Map<String, dynamic> toJson3() => {
        "idCia": idCia.toString(),
        "idPoliza": idPoliza.toString(),
        "idItem": idItem.toString(),
        "idAmparo": idAmparo.toString(),
        "idCausa": idCausa.toString(),
        "idPreReclamo": idPreReclamo.toString(),
        "nroPreReclamo": nroPreReclamo,
        "accidente": accidente,
        "fecAccidente": fecAccidente,
        "idPais": idPais.toString(),
        "idProvincia": idProvincia.toString(),
        "idCiudad": idCiudad.toString(),
        "lugarAccidente": lugarAccidente,
    };


}


class PreReclamos {
  List<PreReclamoModel> items = new List<PreReclamoModel>();

  PreReclamos();
  PreReclamos.fromJsonList( List<dynamic> jsonList  ) { 
    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final PreReclamoModel preReclamo = new PreReclamoModel.fromJson(item);
      items.add( preReclamo );
    }
   }


 PreReclamos.fromMapa( Map<String, dynamic> mapa  ) { 
    if ( mapa == null ) return ;

    mapa.forEach((id,pol) {
      final PreReclamoModel preReclamo = new PreReclamoModel.fromJson(pol);
      //prereclamo.idPoliza = id; 
      items.add( preReclamo );
    });
    
   }
}