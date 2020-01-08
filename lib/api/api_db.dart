import 'dart:convert';

import 'package:appdosinteligente/datos/datos_prueba.dart';
import 'package:appdosinteligente/modelo/menu_model.dart';
import 'package:appdosinteligente/modelo/poliza_model.dart';
import 'package:http/http.dart' as http;
import 'package:appdosinteligente/modelo/poliza_model.dart';
class ApiDB {
   String _urlBase = "https://segurointeligente-d9f49.firebaseio.com";
   
   obtenerPoliza()  async {

     final url = '$_urlBase/polizas.json';
     //con firebase
     final resp = await http.get(url);
     final mapa = json.decode(resp.body); //webApi => jsonList y Firebase => map<String, dynamic>  
     final polizas  = new Polizas.fromMapa(mapa);

    // sin firebase
    //  final polizas  = new Polizas();
    //  polizas.items = [pol01];
    
    
     print("poliza desde firebase...");
     print(polizas);

     //List<Poliza> polizas = [new Poliza(asegurado: "Maria del Carmen Castillo"), new Poliza(asegurado: "Olivia Castillo")];
   
     return polizas.items;
   }

   obtenerMenu()  async {

     final url = '$_urlBase/menu.json';
     final resp = await http.get(url);
     final mapa = json.decode(resp.body); //webApi => jsonList y Firebase => map<String, dynamic>  
     final menus  = new Menus.fromMapa(mapa);
    // print("menus desde firebase...===>");
    // print(menus.items[0].titulo);

     //List<Poliza> polizas = [new Poliza(asegurado: "Maria del Carmen Castillo"), new Poliza(asegurado: "Olivia Castillo")];
   
     return menus.items;
   }



}