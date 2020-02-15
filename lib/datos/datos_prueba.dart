import 'package:appdosinteligente/modelo/modelo_tipo/tcausa_model.dart';
import 'package:appdosinteligente/modelo/notificacion_model.dart';
import 'package:appdosinteligente/modelo/poliza_model.dart';
import 'package:appdosinteligente/modelo/riesgo_auto.dart';
import 'package:appdosinteligente/util/tiempo.dart';

Poliza pol01 = new Poliza(
    broker: "Pablo Cobo",

    fecEmision: "29/04/2008",
    fecDesde: "01/05/2008",
    fecHasta: "01/05/2009",
    idPoliza: 20000,
    moneda: "USD",
    nroPoliza: "98989",
    premio: 450.01,
    ramo: "Vehiculos Personales",
    sumaAsegurada: 12000.01);

NotificacionModel notificacionPrueba = new NotificacionModel(
    idnotificacion: 0,
    titulo: 'nd',
    cuerpo: 'nd',
    fecha: getFechaActual(),
    descripcion: 'su poliza 3234 vencera en 15 dias',
    pagina: '/notificacion');

NotificacionModel notificacionPromocion = new NotificacionModel(
    idnotificacion: 0,
    titulo: 'nd',
    cuerpo: 'nd',
    fecha: getFechaActual(),
    descripcion: 'si reciclas 10 Kg de carton obtene tu premio especial',
    pagina: '/notificacion');


List<RiesgoAutoModel> autoRiesgos = <RiesgoAutoModel>[
  new RiesgoAutoModel(
      idCia: 2,
      idPoliza: 100,
      idItem: 100,
      nroItem: 1,
      marca: "Chevrolet",
      modelo: "Vitara",
      anio: 2008,
      placa: "PBA-876",
      motor: "HYSTS-IHSUS-OSJS",
      chasis: "123-IJSUS-KIUJJS",
      idAsegurado: 1),
       new RiesgoAutoModel(
      idCia: 2,
      idPoliza: 100,
      idItem: 200,
      nroItem: 2,
      marca: "Suzuky",
      modelo: "Forza",
      anio: 2001,
      placa: "IBA-878",
      motor: "KJDUD-KUSHS-KSJS",
      chasis: "9876-KSJSJS-IUJUHW",
      idAsegurado: 1)

];

List<TCausaModel> tcausa = <TCausaModel>[
  new TCausaModel(idCausa: 1, causa:'Robo'),
  new TCausaModel(idCausa: 2, causa:'Choque'),
  
  ];


// mi mundo 
class PremioModel {
  int id;
  String url;
  PremioModel({this.id, this.url});
}

List<PremioModel> lstPremios = <PremioModel>[
  PremioModel(id: 1, url: 'assets/images/animales/rana_01.jpg'),
  PremioModel(id: 2, url: 'assets/images/animales/rana_02.jpg'),
  PremioModel(id: 3, url: 'assets/images/animales/rana_03.jpg'),
  PremioModel(id: 4, url: 'assets/images/animales/rana_03.jpg')
];

