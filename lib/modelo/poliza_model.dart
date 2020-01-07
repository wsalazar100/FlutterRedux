// To parse this JSON data, do
//
//     final poliza = polizaFromJson(jsonString);

import 'dart:convert';

Poliza polizaFromJson(String str) => Poliza.fromJson(json.decode(str));

String polizaToJson(Poliza data) => json.encode(data.toJson());

class Poliza {
    int idPv;
    int nroPol;
    int nroEndoso;
    String ramo;
    String sucursal;
    int anioEndoso;
    String asegurado;
    String fecEmision;
    String fecVigDesde;
    String fecVigHasta;
    String agente;
    double sumaAsegurada;
    double premio;
    String moneda;

    Poliza({
        this.idPv,
        this.nroPol,
        this.nroEndoso,
        this.ramo,
        this.sucursal,
        this.anioEndoso,
        this.asegurado,
        this.fecEmision,
        this.fecVigDesde,
        this.fecVigHasta,
        this.agente,
        this.sumaAsegurada,
        this.premio,
        this.moneda,
    });

    factory Poliza.fromJson(Map<String, dynamic> json) => Poliza(
        idPv: json["idPv"],
        nroPol: json["nroPol"],
        nroEndoso: json["nroEndoso"],
        ramo: json["ramo"],
        sucursal: json["sucursal"],
        anioEndoso: json["anioEndoso"],
        asegurado: json["asegurado"],
        fecEmision: json["fecEmision"],
        fecVigDesde: json["fecVigDesde"],
        fecVigHasta: json["fecVigHasta"],
        agente: json["agente"],
        sumaAsegurada: json["sumaAsegurada"],
        premio: json["premio"],
        moneda: json["moneda"],
    );


    factory Poliza.copiaPoliza(Poliza polizaOrigen) => Poliza(
        idPv: polizaOrigen.idPv,
        nroPol: polizaOrigen.nroPol,
        nroEndoso: polizaOrigen.nroEndoso,
        ramo: polizaOrigen.ramo,
        sucursal: polizaOrigen.sucursal,
        anioEndoso: polizaOrigen.anioEndoso,
        asegurado: polizaOrigen.asegurado,
        fecEmision: polizaOrigen.fecEmision,
        fecVigDesde: polizaOrigen.fecVigDesde,
        fecVigHasta: polizaOrigen.fecVigHasta,
        agente: polizaOrigen.agente,
        sumaAsegurada: polizaOrigen.sumaAsegurada,
        premio: polizaOrigen.premio,
        moneda: polizaOrigen.moneda,
    );


    Map<String, dynamic> toJson() => {
        "idPv": idPv,
        "nroPol": nroPol,
        "nroEndoso": nroEndoso,
        "ramo": ramo,
        "sucursal": sucursal,
        "anioEndoso": anioEndoso,
        "asegurado": asegurado,
        "fecEmision": fecEmision,
        "fecVigDesde": fecVigDesde,
        "fecVigHasta": fecVigHasta,
        "agente": agente,
        "sumaAsegurada": sumaAsegurada,
        "premio": premio,
        "moneda": moneda,
    };
}


class Polizas {
  List<Poliza> items = new List<Poliza>();
  Polizas.fromJsonList( List<dynamic> jsonList  ) { 
    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final Poliza poliza = new Poliza.fromJson(item);
      items.add( poliza );
    }
   }


 Polizas.fromMapa( Map<String, dynamic> mapa  ) { 
    if ( mapa == null ) return ;

    mapa.forEach((id,pol) {
      final Poliza poliza = new Poliza.fromJson(pol);
      //poliza.idPv = id; 
      items.add( poliza );
    });
    
    
   }


}

