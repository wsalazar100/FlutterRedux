

import 'package:appdosinteligente/api/api_db.dart';
import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/modelo/poliza_model.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';


/// 
/// Acciones del Middleware
/// 
ThunkAction<AppEstado> obtenerPolizaAccion = (Store<AppEstado> almacen) async {
  
  final apidb  = ApiDB();
  final polizas = await apidb.obtenerPoliza();

  almacen.dispatch(obtenerPoliza(polizas));

};

/// 
/// Actions del reducer
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






