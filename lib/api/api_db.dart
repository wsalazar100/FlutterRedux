import 'dart:convert';

import 'package:appdosinteligente/Sistema/sistema_constante.dart';
import 'package:appdosinteligente/datos/datos_prueba.dart';
import 'package:appdosinteligente/modelo/menu_model.dart';
import 'package:appdosinteligente/modelo/parametro_model.dart';
import 'package:appdosinteligente/modelo/poliza_model.dart';
import 'package:appdosinteligente/modelo/proveedor_model.dart';
import 'package:appdosinteligente/modelo/usuario_modelo.dart';
import 'package:http/http.dart' as http;
import 'package:appdosinteligente/modelo/poliza_model.dart';
class ApiDB {
   String _urlBase = "https://segurointeligente-d9f49.firebaseio.com";
   
   obtenerPoliza()  async {
   final url = '$_urlBase/polizas.json';
   Polizas polizas;
   try {
      //con firebase
     final resp = await http.get(url);
     final mapa = json.decode(resp.body); //webApi => jsonList y Firebase => map<String, dynamic>  
     polizas  = new Polizas.fromMapa(mapa);

    // sin firebase
    //  final polizas  = new Polizas();
    //  polizas.items = [pol01];
    
    
     print("poliza desde firebase...");
     print(polizas);
     return polizas.items;
     
   } catch (e) {
      print('Error: ${e.toString()}');
      return <Poliza>[];
   }
      

 
     
   }

      
   obtenerProveedor()  async {

     final url = '$_urlBase/proveedor.json';
     //con firebase
     final resp = await http.get(url);
     final mapa = json.decode(resp.body); //webApi => jsonList y Firebase => map<String, dynamic>  
     print("PROVEEDOR desde firebase...");
      print(mapa);
     final ProveedoresModel proveedores  = new ProveedoresModel.fromMapa(mapa);

    // sin firebase
    //  final polizas  = new Polizas();
    //  polizas.items = [pol01];
    
    
     print("PROVEEDOR desde firebase...");
     print(proveedores.items);

 
     return proveedores.items;
   }



   obtenerPolizaPorAsegurado(ParametroConsulta parametroConsulta) async {

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

     return polizas.items;

   }



   Future<UsuarioModel> login(LoginModel login) async {
     
      final url = CONST_URL_AUTENTICACION;

      final authData = {
        'email': login.usuario,
        'password' : login.password,
        'returnSecureToken' : true,
      };

      final res = await http.post(url, body: json.encode(authData));
      Map<String, dynamic> resDecodificada= json.decode(res.body);
      print (resDecodificada);
      UsuarioModel usuario = new UsuarioModel();
      if (resDecodificada.containsKey('idToken')) {
         // Salvar token el el storaga;
         usuario.estaAutenticado = true; usuario.token = resDecodificada['idToken'];

      } else {
          usuario.estaAutenticado = false; usuario.mensaje = resDecodificada['error']['message'];
      }


      return usuario;


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