

import 'package:appdosinteligente/api/api_db.dart';

import 'package:appdosinteligente/api/api_db_local.dart';
import 'package:appdosinteligente/api/api_ubicacion.dart';
import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/modelo/notificacion_model.dart';
import 'package:appdosinteligente/modelo/parametro_model.dart';
import 'package:appdosinteligente/modelo/proveedor_model.dart';
import 'package:appdosinteligente/modelo/ubicacion_model.dart';
import 'package:appdosinteligente/modelo/usuario_modelo.dart';
import 'package:appdosinteligente/modelo/video_model.dart';
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
/// Acciones del Middleware PROVEEDOR
/// 
ThunkAction<AppEstado> obtenerProveedorAccion = (Store<AppEstado> almacen) async {
  
  final apidb  = ApiDB();

  final List<ProveedorModel> proveedores = await apidb.obtenerProveedor();


  almacen.dispatch(ObtenerProveedor(proveedores));

};

/// 
/// Acciones del Middleware VIDEO
/// 
ThunkAction<AppEstado> obtenerVideoAccion = (Store<AppEstado> almacen) async {
  
  final apidb  = ApiDB();

  final List<VideoModel> videos = await apidb.obtenerVideo();

  print("videos ${videos.length}");

  almacen.dispatch(ObtenerVideos(videos));

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

/// 
/// Acciones del Middleware NOTIFICACION
/// 

ThunkAction<AppEstado> agregarNotificacionAccion (NotificacionModel notificacion)  {
  return ( Store<AppEstado> almacen) async  {
       //almacen.dispatch(AgregarNotificacion(notificacion));
       await ApiDBLocal.db.nuevaNoti(notificacion);
       obtenerNotificacionesAccion(almacen);
  };
}

ThunkAction<AppEstado> borrarNotificacionAccion (int idnotificacion)  {
  return ( Store<AppEstado> almacen) async  {
      await ApiDBLocal.db.deleteNotificacion(idnotificacion);
       almacen.dispatch(BorrarNotificacion(idnotificacion));
  };
} // fin 

ThunkAction<AppEstado> borrarTodaNotificacionAccion = (Store<AppEstado> almacen) async {
  await ApiDBLocal.db.deleteAll();
  almacen.dispatch(BorrarTodaNotificacion);


};

ThunkAction<AppEstado> obtenerNotificacionesAccion = (Store<AppEstado> almacen) async {
  List<NotificacionModel> lst = await ApiDBLocal.db.getTodosNotificacion();
  almacen.dispatch(ObtenerNotificaciones(lst));

};


/// 
/// Acciones del UBICACION MAPA
/// 
ThunkAction<AppEstado> obtenerUbicacionAccion = (Store<AppEstado> almacen) async {
  
  final apiUbicacion  = ApiUbicacion();

  final UbicacionModel ubicacion = await apiUbicacion.getLocation();
  print('Ubicacion ');
  print('Ubicacion ==========> ${ubicacion.lat.toString()}   ${ubicacion.lon.toString()}');

  almacen.dispatch(ObtenerUbicacion(ubicacion));

};