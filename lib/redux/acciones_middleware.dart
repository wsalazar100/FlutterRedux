

import 'package:appdosinteligente/api/api_db.dart';
import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/modelo/parametro_model.dart';
import 'package:appdosinteligente/modelo/usuario_modelo.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'acciones.dart';




/// 
/// Acciones del Middleware POLIZA
/// 
ThunkAction<AppEstado> obtenerPolizaAccion = (Store<AppEstado> almacen) async {
  
  final apidb  = ApiDB();

  final polizas = await apidb.obtenerPoliza();


  almacen.dispatch(obtenerPoliza(polizas));

};

/// 
/// Acciones del Middleware MENU
/// 
ThunkAction<AppEstado> obtenerMenuAccion = (Store<AppEstado> almacen) async {
  
  final apidb  = ApiDB();
  final menus = await apidb.obtenerMenu();
  print("menus desde obtenerMenuAccion...===>");
  print(menus[0].titulo);
  almacen.dispatch(obtenerMenu(menus));

};

ThunkAction<AppEstado> getPolizaPorAseguradoAccion (ParametroConsulta parametro)  {
  
  return ( Store<AppEstado> almacen) async  {

       final apidb  = ApiDB();
       final polizas = await apidb.obtenerPolizaPorAsegurado( parametro );

       almacen.dispatch(obtenerPoliza(polizas));
  };

}

/// 
/// Acciones del Middleware LOGIN
/// 
ThunkAction<AppEstado> loginAccion (LoginModel login)  {
  
  return ( Store<AppEstado> almacen) async  {

       final apidb  = ApiDB();
       UsuarioModel usuario = await apidb.login(login);

       almacen.dispatch(ObtenerUsuario(usuario));
  };

}



