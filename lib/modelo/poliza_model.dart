// To parse this JSON data, do
//
//     final poliza = polizaFromJson(jsonString);

// import 'dart:convert';

// Poliza polizaFromJson(String str) => Poliza.fromJson(json.decode(str));

// String polizaToJson(Poliza data) => json.encode(data.toJson());

// class Poliza {
//     int idPoliza;
//     int nroPoliza;
//     int nroEndoso;
//     String ramo;
//     String sucursal;
//     int anioEndoso;
//     String asegurado;
//     String fecEmision;
//     String fecVigDesde;
//     String fecVigHasta;
//     String agente;
//     double sumaAsegurada;
//     double premio;
//     String moneda;

//         double gasto;
//         double superintendencia;
//         double campesino;
//         double otro;
//         double prima;
//         double iva;

//     Poliza({
//         this.idPoliza,
//         this.nroPoliza,
//         this.nroEndoso,
//         this.ramo,
//         this.sucursal,
//         this.anioEndoso,
//         this.asegurado,
//         this.fecEmision,
//         this.fecVigDesde,
//         this.fecVigHasta,
//         this.agente,
//         this.sumaAsegurada,
//         this.premio,
//         this.moneda,
        
//         this.gasto,
//         this.superintendencia,
//         this.campesino,
//         this.otro,
//         this.prima,
//         this.iva,
//     });

//     factory Poliza.fromJson(Map<String, dynamic> json) => Poliza(
//         idPoliza: json["idPoliza"],
//         nroPoliza: json["nroPoliza"],
//         nroEndoso: json["nroEndoso"],
//         ramo: json["ramo"],
//         sucursal: json["sucursal"],
//         anioEndoso: json["anioEndoso"],
//         asegurado: json["asegurado"],
//         fecEmision: json["fecEmision"],
//         fecVigDesde: json["fecVigDesde"],
//         fecVigHasta: json["fecVigHasta"],
//         agente: json["agente"],
//         sumaAsegurada: json["sumaAsegurada"],
//         premio: json["premio"],
//         moneda: json["moneda"],
//           gasto: json["gasto"],
//           superintendencia: json["superintendencia"],
//           campesino: json["campesino"],
//           otro: json["otro"],
//           prima: json["prima"],
//           iva: json["iva"],

//     );


//     factory Poliza.copiaPoliza(Poliza polizaOrigen) => Poliza(
//         idPoliza: polizaOrigen.idPoliza,
//         nroPoliza: polizaOrigen.nroPoliza,
//         nroEndoso: polizaOrigen.nroEndoso,
//         ramo: polizaOrigen.ramo,
//         sucursal: polizaOrigen.sucursal,
//         anioEndoso: polizaOrigen.anioEndoso,
//         asegurado: polizaOrigen.asegurado,
//         fecEmision: polizaOrigen.fecEmision,
//         fecVigDesde: polizaOrigen.fecVigDesde,
//         fecVigHasta: polizaOrigen.fecVigHasta,
//         agente: polizaOrigen.agente,
//         sumaAsegurada: polizaOrigen.sumaAsegurada,
//         premio: polizaOrigen.premio,
//         moneda: polizaOrigen.moneda,

//         gasto: polizaOrigen.gasto,
//         superintendencia: polizaOrigen.superintendencia,
//         campesino: polizaOrigen.campesino,
//         otro: polizaOrigen.otro,
//         prima: polizaOrigen.prima,
//         iva: polizaOrigen.iva,

//     );


//     Map<String, dynamic> toJson() => {
//         "idPoliza": idPoliza,
//         "nroPoliza": nroPoliza,
//         "nroEndoso": nroEndoso,
//         "ramo": ramo,
//         "sucursal": sucursal,
//         "anioEndoso": anioEndoso,
//         "asegurado": asegurado,
//         "fecEmision": fecEmision,
//         "fecVigDesde": fecVigDesde,
//         "fecVigHasta": fecVigHasta,
//         "agente": agente,
//         "sumaAsegurada": sumaAsegurada,
//         "premio": premio,
//         "moneda": moneda,

//         "gasto": gasto,
//         "superintendencia":superintendencia,
//         "campesino":campesino,
//         "otro": otro,
//         "prima": prima,
//         "iva":iva

//     };
// }

// To parse this JSON data, do
//
//     final poliza = polizaFromJson(jsonString);


// To parse this JSON data, do
//
//     final poliza = polizaFromJson(jsonString);
// To parse this JSON data, do
//
//     final poliza = polizaFromJson(jsonString);

import 'dart:convert';

Poliza polizaFromJson(String str) => Poliza.fromJson(json.decode(str));

String polizaToJson(Poliza data) => json.encode(data.toJson());

class Poliza {
    String nroPoliza;
    int idPoliza;
    int idCia;
    int idMoneda;
    String moneda;
    int idRamo;
    String ramo;
    String codRamo;
    int idBroker;
    int codBroker;
    int codTipoBroker;
    String broker;
    String simbolo;
    int idAsegurado;
    int codAsegurado;
    String nroIdentificacion;
    String nroContribuyente;
    String nombre;
    String primerNombre;
    String segundoNombre;
    String primerApellido;
    String segundoApellido;
    String correo;
    String fecEmision;
    String fecDesde;
    String fecHasta;
    double gasto;
    double superintendencia;
    double campesino;
    double otro;
    double prima;
    double premio;
    double iva;
    double sumaAsegurada;
    double saldoFactura;
    bool aceptoRenovacion;

    Poliza({
        this.nroPoliza,
        this.idPoliza,
        this.idCia,
        this.idMoneda,
        this.moneda,
        this.idRamo,
        this.ramo,
        this.codRamo,
        this.idBroker,
        this.codBroker,
        this.codTipoBroker,
        this.broker,
        this.simbolo,
        this.idAsegurado,
        this.codAsegurado,
        this.nroIdentificacion,
        this.nroContribuyente,
        this.nombre,
        this.primerNombre,
        this.segundoNombre,
        this.primerApellido,
        this.segundoApellido,
        this.correo,
        this.fecEmision,
        this.fecDesde,
        this.fecHasta,
        this.gasto,
        this.superintendencia,
        this.campesino,
        this.otro,
        this.prima,
        this.premio,
        this.iva,
        this.sumaAsegurada,
        this.saldoFactura,
        this.aceptoRenovacion,
    });

    factory Poliza.fromJson(Map<String, dynamic> json) => Poliza(
        nroPoliza: json["nroPoliza"],
        idPoliza: json["idPoliza"],
        idCia: json["idCia"],
        idMoneda: json["idMoneda"],
        moneda: json["moneda"],
        idRamo: json["idRamo"],
        ramo: json["ramo"],
        codRamo: json["codRamo"],
        idBroker: json["idBroker"],
        codBroker: json["codBroker"],
        codTipoBroker: json["codTipoBroker"],
        broker: json["broker"],
        simbolo: json["simbolo"],
        idAsegurado: json["idAsegurado"],
        codAsegurado: json["codAsegurado"],
        nroIdentificacion: json["nroIdentificacion"],
        nroContribuyente: json["nroContribuyente"],
        nombre: json["nombre"],
        primerNombre: json["primerNombre"],
        segundoNombre: json["segundoNombre"],
        primerApellido: json["primerApellido"],
        segundoApellido: json["segundoApellido"],
        correo: json["correo"],
        fecEmision: json["fecEmision"],
        fecDesde: json["fecDesde"],
        fecHasta: json["fecHasta"],
        gasto: json["gasto"].toDouble(),
        superintendencia: json["superintendencia"].toDouble(),
        campesino: json["campesino"].toDouble(),
        otro: json["otro"].toDouble(),
        prima: json["prima"].toDouble(),
        premio: json["premio"].toDouble(),
        iva: json["iva"].toDouble(),
        sumaAsegurada: json["sumaAsegurada"].toDouble(),
        saldoFactura: json["saldoFactura"].toDouble(),
        aceptoRenovacion: json["aceptoRenovacion"],
    );


    // factory Poliza.fromJson(Poliza pol) => Poliza(
    //     nroPoliza: pol.nroPoliza,
    //     idPoliza: pol.idPoliza,
    //     idCia: pol.idCia,
    //     idMoneda: pol.idMoneda,
    //     moneda: pol.moneda,
    //     idRamo: pol.idRamo,
    //     ramo: pol.ramo,
    //     codRamo: pol.codRamo,
    //     idBroker: pol.idBroker,
    //     codBroker: pol.codBroker,
    //     codTipoBroker: pol.codTipoBroker,
    //     broker: pol.broker,
    //     simbolo: pol.simbolo,
    //     idAsegurado: pol.idAsegurado,
    //     codAsegurado: pol.codAsegurado,
    //     nroIdentificacion: pol.nroIdentificacion,
    //     nroContribuyente: pol.nroContribuyente,
    //     nombre: pol.nombre,
    //     primerNombre: pol.primerNombre,
    //     segundoNombre: pol.segundoNombre,
    //     primerApellido: pol.primerApellido,
    //     segundoApellido: pol.segundoApellido,
    //     correo: pol.correo,
    //     fecEmision: pol.fecEmision,
    //     fecDesde: pol.fecDesde,
    //     fecHasta: pol.fecHasta,
    //     gasto: pol.gasto,
    //     superintendencia: pol.superintendencia,
    //     campesino: pol.campesino,
    //     otro: pol.otro,
    //     prima: pol.prima,
    //     premio: pol.premio,
    //     iva: pol.iva,
    //     sumaAsegurada: pol.sumaAsegurada,
    //     saldoFactura: pol.saldoFactura,
    //     aceptoRenovacion: pol.aceptoRenovacion
    // );

    Map<String, dynamic> toJson() => {
        "nroPoliza": nroPoliza,
        "idPoliza": idPoliza,
        "idCia": idCia,
        "idMoneda": idMoneda,
        "moneda": moneda,
        "idRamo": idRamo,
        "ramo": ramo,
        "codRamo": codRamo,
        "idBroker": idBroker,
        "codBroker": codBroker,
        "codTipoBroker": codTipoBroker,
        "broker": broker,
        "simbolo": simbolo,
        "idAsegurado": idAsegurado,
        "codAsegurado": codAsegurado,
        "nroIdentificacion": nroIdentificacion,
        "nroContribuyente": nroContribuyente,
        "nombre": nombre,
        "primerNombre": primerNombre,
        "segundoNombre": segundoNombre,
        "primerApellido": primerApellido,
        "segundoApellido": segundoApellido,
        "correo": correo,
        "fecEmision": fecEmision,
        "fecDesde": fecDesde,
        "fecHasta": fecHasta,
        "gasto": gasto,
        "superintendencia": superintendencia,
        "campesino": campesino,
        "otro": otro,
        "prima": prima,
        "premio": premio,
        "iva": iva,
        "sumaAsegurada": sumaAsegurada,
        "saldoFactura": saldoFactura,
        "aceptoRenovacion": aceptoRenovacion,
    };
}



class Polizas {
  List<Poliza> items = new List<Poliza>();

  Polizas();
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
      //poliza.idPoliza = id; 
      items.add( poliza );
    });
    
   }


}

