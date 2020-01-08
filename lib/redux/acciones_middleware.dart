

import 'package:appdosinteligente/api/api_db.dart';
import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/modelo/login_modelo.dart';
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


ThunkAction<AppEstado> autenticarUsuarioAccion = (Store<AppEstado> almacen) async {
  
  final apidb  = ApiDB();
  //final menus = await apidb.autenticarUsuario(login);

  //almacen.dispatch(obtenerMenu(menus));

};
