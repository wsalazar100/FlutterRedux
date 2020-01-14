
import 'package:appdosinteligente/modelo/notificacion_model.dart';
import 'package:appdosinteligente/modelo/poliza_model.dart';
import 'package:appdosinteligente/util/tiempo.dart';

Poliza pol01 = new Poliza(
      agente : "Pablo Cobo",
      anioEndoso : 2008,
      asegurado : "William Salazar",
      fecEmision : "29/04/2008",
      fecVigDesde : "01/05/2008",
      fecVigHasta : "01/05/2009",
      idPv : 20000,
      moneda : "USD",
      nroEndoso : 0,
      nroPol : 2500,
      premio : 450.01,
      ramo : "Vehiculos Personales",
      sucursal : "Quito",
      sumaAsegurada : 12000.01
);


NotificacionModel notificacionPrueba = new NotificacionModel(
           idnotificacion: 0,
           titulo: 'nd',
           cuerpo: 'nd',
           fecha: getFechaActual(),
           descripcion: 'su poliza 3234 vencera en 15 dias', 
           pagina: '/notificacion'
           );
           

