import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/modelo/notificacion_model.dart';
import 'package:appdosinteligente/redux/acciones_middleware.dart';
import 'package:appdosinteligente/tema/poliza_estilo.dart';
import 'package:appdosinteligente/util/interfase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class NotificacionPagina extends StatefulWidget {
  NotificacionPagina({Key key}) : super(key: key);

  @override
  _NotificacionPaginaState createState() => _NotificacionPaginaState();
}

class _NotificacionPaginaState extends State<NotificacionPagina> {
  AppEstado _appEstado;

  borrarNotificacion(int idnotificacion) {
     StoreProvider.of<AppEstado>(context).dispatch(borrarNotificacionAccion(idnotificacion));
  }
    // acciones
  obtenerNotificaciones(context) {
    StoreProvider.of<AppEstado>(context).dispatch(obtenerNotificacionesAccion);
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => obtenerNotificaciones(context));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StoreConnector<AppEstado, AppEstado>(
            converter: (almacen) => almacen.state,
            builder: (context, AppEstado appEstado) {
              _appEstado = appEstado;
              print(" longitud de notificacion ====>");
              print(_appEstado.notificaciones.length);
              return _crearPagina(context);
            }));
  }

  _crearPagina(BuildContext context) {
    return Scaffold(appBar: _crearAppBar(), body: _crearBody());
  }

  _crearAppBar() {
    return AppBar(title: Text("Notificaciones"));
  }

  _crearBodyOld() {
    List<NotificacionModel> lst = _appEstado.notificaciones;
    return Stack(
      children: <Widget>[
        crearGradientePagina(),
        ListView.builder(
          itemCount: lst.length,
          itemBuilder: (BuildContext context, int index) =>
              _crearCard(lst[index]),
        )
      ],
    );
  }

  _crearBody() {
    List<NotificacionModel> lst = _appEstado.notificaciones;
    return SingleChildScrollView(
      child: Column(children: lst.map((noti) => _crearCard(noti)).toList()),
    );
  }

  Widget _crearCard(NotificacionModel notificacion) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red),
      onDismissed: (direction) =>borrarNotificacion(notificacion.idnotificacion),
      child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          height: 100,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Fecha: ${notificacion.fecha}',
                  style: tituloCard,
                  textAlign: TextAlign.right,
                ),
                Text(
                  'idnotificacion: ${notificacion.idnotificacion}',
                  style: cuerpo,
                ),
                Text(
                  'Descripcion: ${notificacion.descripcion}',
                  style: cuerpo,
                ),
              ])),
    );
  }
} //_NotificacionPaginaState
