

import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/redux/acciones.dart';

AppEstado reducer(AppEstado previoEstado, dynamic accion) {
  AppEstado nuevoEstado = AppEstado.desdeAppEstado(previoEstado);

  // obtener
  if (accion is obtenerPoliza) {
      nuevoEstado.polizas = accion.polizas;
  }


  // agrega
  if (accion is agregarPoliza) {
      nuevoEstado.polizas.add(accion.poliza);
  }

  // borra
  if (accion is borrarPoliza) {
      nuevoEstado.polizas = nuevoEstado.polizas.where((p) => p.idPv != accion.idPv);
  }
  
  // actualizacion
  if (accion is actualizarPoliza) {
      nuevoEstado.polizas = nuevoEstado.polizas
                                       .map((p) => p.idPv == accion.poliza.idPv ? accion.poliza : p)
                                       .toList();
  }

 // obtener
  if (accion is obtenerMenu) {
      nuevoEstado.menus = accion.menus;
  }

  return nuevoEstado;



}
