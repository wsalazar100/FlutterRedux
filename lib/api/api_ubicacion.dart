import 'package:appdosinteligente/modelo/ubicacion_model.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

class ApiUbicacion {
  Location _location = Location();
  String error;

  static ApiUbicacion _instancia;
  static ApiUbicacion instancia() => _instancia;

  Future<UbicacionModel> getLocation() async {
    LocationData ubicacion;
    try {
       ubicacion = await _location.getLocation();
       error = null;

    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED'){
         error = 'Permiso negado';
      } else if ( e.code == 'PERMISSION_DENIED_NEVER_ASK') {
         error = 'Permiso denegado - por favor solicite al usuario habilitar desde la configuracion';

      }
      _location = null;
    }

    return UbicacionModel.fromLocation(ubicacion);
  }
 
}