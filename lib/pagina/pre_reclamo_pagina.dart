import 'package:appdosinteligente/api/api_riesgo_auto.dart';
import 'package:appdosinteligente/constantes/interface.dart';
import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/modelo/modelo_tipo/tcausa_model.dart';
import 'package:appdosinteligente/modelo/parametro_model.dart';
import 'package:appdosinteligente/modelo/poliza_model.dart';
import 'package:appdosinteligente/modelo/pre_reclamo_model.dart';
import 'package:appdosinteligente/modelo/riesgo_auto.dart';
import 'package:appdosinteligente/redux/acciones_middleware.dart';
import 'package:appdosinteligente/widget/campo_fecha.dart';
import 'package:appdosinteligente/widget/campo_texto_widget.dart';
import 'package:appdosinteligente/widget/combos/cmb_riesgo_auto.dart';
import 'package:appdosinteligente/widget/combos/cmb_ttipo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class PreReclamoPagina extends StatefulWidget {
  final void Function() onInit;

  obtenerRiesgoAuto(context, parametroConsulta) {
    StoreProvider.of<AppEstado>(context)
        .dispatch(obtenerRiesgosAutoPorPolizaAccion(parametroConsulta));
  }

  grabarPreReclamo(context, preReclamo) {
    StoreProvider.of<AppEstado>(context)
        .dispatch(grabarPreReclamoAccion(preReclamo));
  }

  obtenerTCausa(context) {
    StoreProvider.of<AppEstado>(context).dispatch(obtenerTCausaAccion);
  }

  PreReclamoPagina({this.onInit});

  @override
  _PreReclamoPaginaState createState() => _PreReclamoPaginaState();
}

class _PreReclamoPaginaState extends State<PreReclamoPagina> {
  final _frmPreReclamo = GlobalKey<FormState>();
  PreReclamoModel preReclamo = new PreReclamoModel();
  TCausaModel causaSel = new TCausaModel();
  RiesgoAutoModel riegoSel = new RiesgoAutoModel();
  Poliza poliza;

  @override
  void initState() {
    super.initState();
    // ParametroConsulta parametroConsulta;
    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) => widget.obtenerRiesgoAuto(context,parametroConsulta));
  }

  @override
  Widget build(BuildContext context) {
    // recibe la poliza
    poliza = ModalRoute.of(context).settings.arguments;
    ParametroConsulta parametroConsulta =
        ParametroConsulta(idPoliza: poliza.idPoliza);
    parametroConsulta.idPoliza = poliza.idPoliza;

    // consulta los riesgos
    widget.obtenerRiesgoAuto(context, parametroConsulta);
    widget.obtenerTCausa(context);

    // muestra los riesgos
    return Container(
        child: StoreConnector<AppEstado, AppEstado>(
            converter: (almacen) => almacen.state,
            builder: (context, AppEstado appEstado) {
              return _crearPagina(context, appEstado);
            }));
  }

  _crearPagina(BuildContext context, AppEstado appEstado) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: _crearAppBar(),

      body: _crearBody(context, appEstado),
      // floatingActionButton: _crearBoton(appEstado),
    );
  }

  _crearAppBar() {
    return AppBar(
        backgroundColor: Colors.black, title: Text("Apertura del Reclamo"));
  }

  _crearBody(BuildContext context, AppEstado appEstado) {
    return Container(
      // decoration: _crearFondoPagina(),
      child: _crearContenido(context, appEstado),
    );
  }

  _crearContenido(BuildContext context, AppEstado appEstado) {
    // print(" causa recuperada ==================>");
    // print(appEstado.tcausa);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _frmPreReclamo,
          child: Column(
            children: <Widget>[
              CmbRiesgoAuto(
                  riesgos: appEstado.riesgoAutos,
                  onTomaValor: (sel) => riegoSel = sel),
              CmbTTipo(
                tipos: appEstado.tcausa,
                tabla: 'tcausa',
                onTomaValor: (sel) => causaSel = sel,
              ),
              CampoTexto(
                  hintText: "Lugar del accidentes:",
                  isEmail: false,
                  validator: (value) => value.length <= 1
                      ? 'coloque el lugar del accidente'
                      : null,
                  onSaved: (String value) {
                    preReclamo.lugarAccidente = value;
                  }),
              CampoTexto(
                  hintText: "Descripción del accidente:",
                  isEmail: false,
                  validator: (String value) => value.length <= 1
                      ? 'decriba como ocurrio el accidente'
                      : null,
                  onSaved: (String value) {
                    preReclamo.accidente = value;
                  }),
              CampoFecha(
                hintText: "Fecha del accidente:",
                validator: (value) =>
                    value.length <= 1 ? 'Fecha del accidente' : null,
                onSaved: (value) => preReclamo.fecAccidente = value,
              ),
              btnRecupera()
            ],
          ),
        ),
      ),
    );
  }


  btnRecupera() {
    return FloatingActionButton.extended(
      label: Text('Grabar'),
      icon: Icon(Icons.save),
      backgroundColor: Colors.pink,
      onPressed: () {
                  if (_frmPreReclamo.currentState.validate()) {
              _frmPreReclamo.currentState.save();
            }

            // combos
            if (causaSel is TCausaModel) {
              print(causaSel.causa);
              preReclamo.idCausa = causaSel.idCausa;
            }

            if (riegoSel is RiesgoAutoModel) {
              print(riegoSel.idItem.toString());
              preReclamo.idItem = riegoSel.idItem;
            }

            //fecha
            print(" FECHA ACCIDENTE ");
            print(preReclamo.fecAccidente);

            print(" LUGAR ");
            print(preReclamo.lugarAccidente);

            print(" ACCIDENTE ");
            print(preReclamo.accidente);

            // completa relacion foraneas
            preReclamo.idPoliza = poliza.idPoliza;
            preReclamo.idPreReclamo = 1;
            preReclamo.idCia = poliza.idCia;
            preReclamo.idPais = 1;
            preReclamo.idProvincia = 1;
            preReclamo.idCiudad = 1;
            preReclamo.idAmparo = 1;
            preReclamo.nroPreReclamo = "GYE-VEH-123";
            widget.grabarPreReclamo(context, preReclamo);
      },
    );

  }

  // btnRecuperaOld() {
  //   return Container(
  //       decoration: BoxDecoration(
  //           color: Color(COLOR_FONDO_ICON_BUTTON),
  //           // borderRadius: BorderRadius.circular(BORDER_RADIUS_BUTTON)
  //           ),
  //       child: IconButton(
  //         icon: Icon(Icons.mood_bad, color: Colors.pink),
  //         onPressed: () async {
  //           // disparar los eventos
  //           if (_frmPreReclamo.currentState.validate()) {
  //             _frmPreReclamo.currentState.save();
  //           }

  //           // combos
  //           if (causaSel is TCausaModel) {
  //             print(causaSel.causa);
  //             preReclamo.idCausa = causaSel.idCausa;
  //           }

  //           if (riegoSel is RiesgoAutoModel) {
  //             print(riegoSel.idItem.toString());
  //             preReclamo.idItem = riegoSel.idItem;
  //           }

  //           //fecha
  //           print(" FECHA ACCIDENTE ");
  //           print(preReclamo.fecAccidente);

  //           print(" LUGAR ");
  //           print(preReclamo.lugarAccidente);

  //           print(" ACCIDENTE ");
  //           print(preReclamo.accidente);

  //           // completa relacion foraneas
  //           preReclamo.idPoliza = poliza.idPoliza;
  //           preReclamo.idPreReclamo = 1;
  //           preReclamo.idCia = poliza.idCia;
  //           preReclamo.idPais = 1;
  //           preReclamo.idProvincia = 1;
  //           preReclamo.idCiudad = 1;
  //           preReclamo.idAmparo = 1;
  //           preReclamo.nroPreReclamo = "GYE-VEH-123";
  //           widget.grabarPreReclamo(context, preReclamo);

  //           // print('CAUSA ' + causaSel.causa );
  //           //  print('CODIGO CAUSA' + causaSel.idCausa.toString() );
  //         },
  //       ));
  // }

  _seleccionaFecha(BuildContext context) async {
    DateTime selector = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now(),
      lastDate: new DateTime.now(),
    );
    if (selector != null) {
      preReclamo.fecAccidente = selector.toString();
    }
  }
} // fin pagina
