import 'dart:convert';

import 'package:appdosinteligente/Sistema/sistema_constante.dart';
import 'package:appdosinteligente/constantes/api.dart';
import 'package:appdosinteligente/datos/datos_prueba.dart';
import 'package:appdosinteligente/modelo/menu_model.dart';
import 'package:appdosinteligente/modelo/modelo_tipo/tcausa_model.dart';
import 'package:appdosinteligente/modelo/parametro_model.dart';
import 'package:appdosinteligente/modelo/poliza_model.dart';

import 'package:appdosinteligente/modelo/proveedor_model.dart';
import 'package:appdosinteligente/modelo/riesgo_auto.dart';
import 'package:appdosinteligente/modelo/usuario_modelo.dart';
import 'package:appdosinteligente/modelo/video_model.dart';
import 'package:http/http.dart' as http;
import 'package:appdosinteligente/modelo/poliza_model.dart';

class ApiDB {
  // String _urlBase = "https://segurointeligente-d9f49.firebaseio.com";
   String _urlBase = SRV_API;

  obtenerPoliza() async {
    // final url = '$_urlBase/polizas.json';
     final url = '$_urlBase/api/vpoliza';

    


    Polizas polizas;
    try {
      //con firebase
        print("Resultado...");  
      final resp = await http.get(url);
      final mapa = json.decode(
          resp.body); //webApi => jsonList y Firebase => map<String, dynamic>
        print(mapa);
      polizas = new Polizas.fromJsonList(mapa);

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
  } // fin obtenerPoliza

  obtenerVideo() async {
    final url = '$_urlBase/video.json';
    VideosModel videos;
    try {
      //con firebase
      final resp = await http.get(url);
      final mapa = json.decode(
          resp.body); //webApi => jsonList y Firebase => map<String, dynamic>
      videos =  VideosModel.fromMapa(mapa);

      return videos.items;
    } catch (e) {
      print('Error: ${e.toString()}');
      return <VideoModel>[];
    }
  } // 

  obtenerProveedor() async {
    // final url = '$_urlBase/proveedor.json';
    final url = '$_urlBase/api/tproveedor';

    //con firebase
    final resp = await http.get(url);
    final mapa = json.decode(
        resp.body); //webApi => jsonList y Firebase => map<String, dynamic>
    print("PROVEEDOR desde firebase...");
    print(mapa);
    final ProveedoresModel proveedores = new ProveedoresModel.fromJsonList(mapa);

    // sin firebase
    //  final polizas  = new Polizas();
    //  polizas.items = [pol01];

    print("PROVEEDOR desde firebase...");
    print(proveedores.items.length);

    return proveedores.items;
  }

  obtenerPolizaPorAsegurado(ParametroConsulta parametroConsulta) async {
    print('obtenerPolizaPorAsegurado ...');
    final url = '$_urlBase/polizas.json';
    //con firebase
    final resp = await http.get(url);
    final mapa = json.decode(
        resp.body); //webApi => jsonList y Firebase => map<String, dynamic>
    final polizas = new Polizas.fromMapa(mapa);

    // sin firebase
    //  final polizas  = new Polizas();
    //  polizas.items = [pol01];

    print("poliza desde firebase...");
    print(polizas);

    return polizas.items;
  }

  

  // Tablas tipo

    obtenerRiesgoAutoPorPoliza(ParametroConsulta parametroConsulta) async {
     final url = '$_urlBase/api/poliza/riesgoauto/' + parametroConsulta.idPoliza.toString();
    // //con firebase
    final resp = await http.get(url);
    final mapa = json.decode(resp.body); //webApi => jsonList y Firebase => map<String, dynamic>
          print("Resultado Riesgos...");    
        print(mapa);
    final riesgoAutos = new RiesgoAutos.fromJsonList(mapa);

    // sin firebase
     //final RiesgoAutos riesgoAutos = new RiesgoAutos();
     //riesgoAutos.items = autoRiesgos ;

    print("cantiad riesgos de auto desde firebase...");
    print(riesgoAutos.items.length);

    return riesgoAutos.items;
  }

    obtenerTCausa() async {
    // final url = '$_urlBase/polizas.json';
    // //con firebase
    // final resp = await http.get(url);
    // final mapa = json.decode(
    //     resp.body); //webApi => jsonList y Firebase => map<String, dynamic>
    // final polizas = new Polizas.fromMapa(mapa);

    // sin firebase
     final TCausas tcausas = new TCausas();
     tcausas.items = tcausa;

    print("riesgos de auto desde firebase...");
    print(tcausas.items);

    return tcausas.items;
  }

  





  Future<UsuarioModel> login(LoginModel login) async {
    final url = CONST_URL_AUTENTICACION;

    final authData = {
      'email': login.usuario,
      'password': login.password,
      'returnSecureToken': true,
    };

    final res = await http.post(url, body: json.encode(authData));
    Map<String, dynamic> resDecodificada = json.decode(res.body);
    print(resDecodificada);
    UsuarioModel usuario = new UsuarioModel();
    if (resDecodificada.containsKey('idToken')) {
      // Salvar token el el storaga;
      usuario.estaAutenticado = true;
      usuario.token = resDecodificada['idToken'];
    } else {
      usuario.estaAutenticado = false;
      usuario.mensaje = resDecodificada['error']['message'];
    }

    return usuario;
  }

  obtenerMenu() async {
    final url = '$_urlBase/menu.json';
    final resp = await http.get(url);
    final mapa = json.decode(
        resp.body); //webApi => jsonList y Firebase => map<String, dynamic>
    final menus = new Menus.fromMapa(mapa);
    // print("menus desde firebase...===>");
    // print(menus.items[0].titulo);

    //List<Poliza> polizas = [new Poliza(asegurado: "Maria del Carmen Castillo"), new Poliza(asegurado: "Olivia Castillo")];

    return menus.items;
  }
}
