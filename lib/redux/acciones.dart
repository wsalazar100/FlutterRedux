

import 'package:appdosinteligente/modelo/menu_model.dart';
import 'package:appdosinteligente/modelo/parametro_model.dart';
import 'package:appdosinteligente/modelo/poliza_model.dart';
import 'package:appdosinteligente/modelo/usuario_modelo.dart';


/// 
/// Actions del reducer POLIZA
/// 

class obtenerPoliza {
   List<Poliza> _polizas;
   obtenerPoliza(this._polizas);
   List<Poliza> get polizas => this._polizas;
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







