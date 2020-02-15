
import 'package:appdosinteligente/constantes/api.dart';
import 'package:http/http.dart' as http;
import 'package:appdosinteligente/modelo/pre_reclamo_model.dart';
import 'dart:convert';

class ApiPreReclamo {
  // String _urlBase = "https://segurointeligente-d9f49.firebaseio.com";
   String _urlBase = SRV_API;

  grabaPreReclamo(PreReclamoModel preReclamo) async {
       final url = '$_urlBase/api/prereclamo';
       print("enviando...................." + url);
       print(   jsonEncode( preReclamo.toJson()));
       Map<String, String> header = { "Accept": "application/json",  "Content-Type": "application/json" };   //new Map<String,String>();

       
       final resp = await http.post(
         url, 
         headers: header,
         body: jsonEncode( preReclamo.toJson() )
        );

       print('Response status: ${resp.statusCode}');
       print('Response body: ${resp.body}');
       
  }

}