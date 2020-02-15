// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'dart:convert';

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
    String id;
    String titulo;
    String icono;
    String ruta;

    Menu({
        this.id,
        this.titulo,
        this.icono,
        this.ruta,
    });

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        titulo: json["titulo"],
        icono: json["icono"],
        ruta: json["ruta"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "icono": icono,
        "ruta": ruta,
    };
}

class Menus {
  List<Menu> items = new List<Menu>();

  Menus.fromJsonList( List<dynamic> jsonList  ) { 
    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final Menu menu = new Menu.fromJson(item);
      items.add( menu );
    }
   }

 Menus.fromMapa( Map<String, dynamic> mapa  ) { 
    if ( mapa == null ) return ;

    mapa.forEach((id,men) {
      final Menu menu = new Menu.fromJson(men);
      //poliza.idPoliza = id; 
      items.add( menu );
    });
    
   }
  
}


