

import 'package:appdosinteligente/modelo/menu_model.dart';
import 'package:appdosinteligente/modelo/notificacion_model.dart';
import 'package:appdosinteligente/modelo/parametro_model.dart';
import 'package:appdosinteligente/modelo/poliza_model.dart';
import 'package:appdosinteligente/modelo/proveedor_model.dart';
import 'package:appdosinteligente/modelo/ubicacion_model.dart';
import 'package:appdosinteligente/modelo/usuario_modelo.dart';


/// 
/// Actions del reducer POLIZA
/// 

class obtenerPoliza {
   List<Poliza> _polizas;
   obtenerPoliza(this._polizas);
   List<Poliza> get polizas => this._polizas;
}


class ObtenerProveedor {
   List<ProveedorModel> _proveedores;
   ObtenerProveedor(this._proveedores);
   List<ProveedorModel> get proveedores => this._proveedores;
}


class CambiarParametroConsulta {
   ParametroConsulta _parametroConsulta;
   CambiarParametroConsulta(this._parametroConsulta);
   ParametroConsulta get parametroConsulta => this._parametroConsulta;
}


class agregarPoliza {
  Poliza poliza;
  agregarPoliza( this.poliza);
} 

class borrarPoliza {
  int idPv;
  borrarPoliza( this.idPv);
}

class actualizarPoliza {
   Poliza poliza;
   actualizarPoliza(this.poliza);
}


/// 
/// Actions del reducer MENU
/// 

class obtenerMenu {
   List<Menu> _menus;
   obtenerMenu(this._menus);
   List<Menu> get menus => this._menus;
}



/// 
/// Actions del reducer USUARIO
/// 

class ObtenerUsuario {
   UsuarioModel _usuario;
   ObtenerUsuario(this._usuario);
   UsuarioModel get usuario => this._usuario;
}


/// 
/// Actions del reducer NOTIFICACION
/// 
class AgregarNotificacion {
    NotificacionModel _notificacion;
    AgregarNotificacion(this._notificacion);
    NotificacionModel get notificacion => this._notificacion;
}

class BorrarNotificacion {
    int _idnotificacion;
    BorrarNotificacion(this._idnotificacion);
    int get idnotificacion => this._idnotificacion;
}

class BorrarTodaNotificacion {
    BorrarTodaNotificacion();
}

class ObtenerNotificaciones {
    List<NotificacionModel> _notificaciones;
    ObtenerNotificaciones(this._notificaciones);
    List<NotificacionModel> get notificaciones => this._notificaciones;
}

class ObtenerUbicacion {
   UbicacionModel _ubicacion;
   ObtenerUbicacion(this._ubicacion);
   UbicacionModel get ubicacion => this._ubicacion;
}


