

import 'package:appdosinteligente/modelo/menu_model.dart';
import 'package:appdosinteligente/modelo/poliza_model.dart';


/// 
/// Actions del reducer POLIZA
/// 

class obtenerPoliza {
   List<Poliza> _polizas;
   obtenerPoliza(this._polizas);
   List<Poliza> get polizas => this._polizas;
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









