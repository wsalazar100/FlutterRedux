import 'dart:convert';

import 'package:appdosinteligente/modelo/poliza_model.dart';
import 'package:http/http.dart' as http;
import 'package:appdosinteligente/modelo/poliza_model.dart';
class ApiDB {
   String _urlBase = "https://segurointeligente-d9f49.firebaseio.com";
   obtenerPoliza()  async {

     final url = '$_urlBase/polizas.json';
     final resp = await http.get(url);
     final mapa = json.decode(resp.body); //webApi => jsonList y Firebase => map<String, dynamic>  
     final polizas  = new Polizas.fromMapa(mapa);
     print("poliza desde firebase...");
     print(polizas);

     //List<Poliza> polizas = [new Poliza(asegurado: "Maria del Carmen Castillo"), new Poliza(asegurado: "Olivia Castillo")];
   
     return polizas.items;
   }

}