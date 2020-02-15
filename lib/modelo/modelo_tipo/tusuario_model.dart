// To parse this JSON data, do
//
//     final tUsuario = tUsuarioFromJson(jsonString);
// To parse this JSON data, do
//
//     final tUsuarioModel = tUsuarioModelFromJson(jsonString);

import 'dart:convert';

TUsuarioModel tUsuarioModelFromJson(String str) => TUsuarioModel.fromJson(json.decode(str));

String tUsuarioModelToJson(TUsuarioModel data) => json.encode(data.toJson());

class TUsuarioModel {
    int idCia;
    int idUsuario;
    String usuario;
    String clave;
    String nombreCompleto;
    String direccion;
    String correo;
    String celular;
    String telefono;
    String foto;
    String nroIdentificacion;
    int idTipoIdentificacion;
    bool estaActivo;

    TUsuarioModel({
        this.idCia,
        this.idUsuario,
        this.usuario,
        this.clave,
        this.nombreCompleto,
        this.direccion,
        this.correo,
        this.celular,
        this.telefono,
        this.foto,
        this.nroIdentificacion,
        this.idTipoIdentificacion,
        this.estaActivo,
    });

    factory TUsuarioModel.fromJson(Map<String, dynamic> json) => TUsuarioModel(
        idCia: json["idCia"],
        idUsuario: json["idUsuario"],
        usuario: json["usuario"],
        clave: json["clave"],
        nombreCompleto: json["nombreCompleto"],
        direccion: json["direccion"],
        correo: json["correo"],
        celular: json["celular"],
        telefono: json["telefono"],
        foto: json["foto"],
        nroIdentificacion: json["nroIdentificacion"],
        idTipoIdentificacion: json["idTipoIdentificacion"],
        estaActivo: json["estaActivo"],
    );

    Map<String, dynamic> toJson() => {
        "idCia": idCia,
        "idUsuario": idUsuario,
        "usuario": usuario,
        "clave": clave,
        "nombreCompleto": nombreCompleto,
        "direccion": direccion,
        "correo": correo,
        "celular": celular,
        "telefono": telefono,
        "foto": foto,
        "nroIdentificacion": nroIdentificacion,
        "idTipoIdentificacion": idTipoIdentificacion,
        "estaActivo": estaActivo,
    };
}


class TUsuarios {
  List<TUsuarioModel> items = new List<TUsuarioModel>();

  TUsuarios();
  TUsuarios.fromJsonList( List<dynamic> jsonList  ) { 
    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final TUsuarioModel tusuario = new TUsuarioModel.fromJson(item);
      items.add( tusuario );
    }
   }

 TUsuarios.fromMapa( Map<String, dynamic> mapa  ) { 
    if ( mapa == null ) return ;
    mapa.forEach((id,causa) {
      final TUsuarioModel tusuario = new TUsuarioModel.fromJson(causa);
      items.add( tusuario );
    });
    
   }


}

