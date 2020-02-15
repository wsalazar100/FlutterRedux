// To parse this JSON data, do
//
//     final tCausaModel = tCausaModelFromJson(jsonString);

import 'dart:convert';

TCausaModel tCausaModelFromJson(String str) => TCausaModel.fromJson(json.decode(str));

String tCausaModelToJson(TCausaModel data) => json.encode(data.toJson());

class TCausaModel {
    int idCausa;
    String causa;

    TCausaModel({
        this.idCausa,
        this.causa,
    });

    factory TCausaModel.fromJson(Map<String, dynamic> json) => TCausaModel(
        idCausa: json["idCausa"],
        causa: json["causa"],
    );

    Map<String, dynamic> toJson() => {
        "idCausa": idCausa,
        "causa": causa,
    };
}


class TCausas {
  List<TCausaModel> items = new List<TCausaModel>();

  TCausas();
  TCausas.fromJsonList( List<dynamic> jsonList  ) { 
    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final TCausaModel tcausa = new TCausaModel.fromJson(item);
      items.add( tcausa );
    }
   }

 TCausas.fromMapa( Map<String, dynamic> mapa  ) { 
    if ( mapa == null ) return ;
    mapa.forEach((id,causa) {
      final TCausaModel tcausa = new TCausaModel.fromJson(causa);
      items.add( tcausa );
    });
    
   }


}





