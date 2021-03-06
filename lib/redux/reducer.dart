

import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/redux/acciones.dart';

AppEstado reducer(AppEstado previoEstado, dynamic accion) {
  AppEstado nuevoEstado = AppEstado.desdeAppEstado(previoEstado);

  // obtener
  if (accion is obtenerPoliza) {
      nuevoEstado.polizas = accion.polizas;
  }



    if (accion is ObtenerTUsuario) {
      nuevoEstado.tusuario = accion.tusuario;
  }
  


  if (accion is ObtenerProveedor) {
      nuevoEstado.proveedores = accion.proveedores;
  }
  
  if (accion is ObtenerRiesgoAutos) {
      nuevoEstado.riesgoAutos = accion.riesgoAutos;
  }


  if (accion is ObtenerVideos) {
      nuevoEstado.videos = accion.videos;
  }

  if (accion is CambiarParametroConsulta) {
      nuevoEstado.parametroConsulta = accion.parametroConsulta;
  }



  // agrega
  if (accion is agregarPoliza) {
      nuevoEstado.polizas.add(accion.poliza);
  }

  // borra
  if (accion is borrarPoliza) {
      nuevoEstado.polizas = nuevoEstado.polizas.where((p) => p.idPoliza != accion.idPoliza);
  }
  
  // actualizacion
  if (accion is actualizarPoliza) {
      nuevoEstado.polizas = nuevoEstado.polizas
                                       .map((p) => p.idPoliza == accion.poliza.idPoliza ? accion.poliza : p)
                                       .toList();
  }

 // obtener
  if (accion is obtenerMenu) {
      nuevoEstado.menus = accion.menus;
  }


  // REDUCER USUARIO
  if (accion is ObtenerUsuario) {
      nuevoEstado.usuario = accion.usuario;
  }

  // REDUCER NOTIFICACION
  if (accion is AgregarNotificacion) {
      nuevoEstado.notificaciones.add(accion.notificacion);
  }

  if (accion is BorrarNotificacion) {
      nuevoEstado.notificaciones.removeWhere((n)=> n.idnotificacion == accion.idnotificacion);
  }

  if (accion is BorrarTodaNotificacion) {
      nuevoEstado.notificaciones = [];
  }
  if (accion is ObtenerNotificaciones) {
      nuevoEstado.notificaciones = accion.notificaciones;
  }

  // REDUCER UBICACION
  if (accion is ObtenerUbicacion) {
      nuevoEstado.ubicacion = accion.ubicacion;
  }


  // REDUCER TABLAS TIPO
  if (accion is ObtenerTCausa) {
      nuevoEstado.tcausa = accion.tcausa;
  }



  return nuevoEstado;



}
