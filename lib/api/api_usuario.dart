
import 'package:appdosinteligente/constantes/api.dart';
import 'package:appdosinteligente/modelo/modelo_tipo/tusuario_model.dart';
import 'package:appdosinteligente/modelo/parametro_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiUsuario {
 
  String _urlBase = SRV_API;

  getTUsuario(ParametroConsulta parametro) async {
       final url = '$_urlBase/api/tusuario/' + parametro.idUsuario.toString() ;

       Map<String, String> header = { "Accept": "application/json",  "Content-Type": "application/json" };   //new Map<String,String>();
       
       final resp = await http.get(
         url, 
         headers: header,
        );
       final lista = json.decode(resp.body); 
        print("Usuarios....");    
        print(lista);
        TUsuarios tusuarios = new TUsuarios.fromJsonList(lista);
        return tusuarios.items;
       
  }

}