import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/modelo/poliza_model.dart';

import 'package:appdosinteligente/redux/acciones.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class PolizaPagina extends StatefulWidget {
  final void Function() onInit;


  PolizaPagina({this.onInit});

  // acciones
  obtenerPoliza(context) {
     StoreProvider.of<AppEstado>(context).dispatch(obtenerPolizaAccion);
  }

  @override
  _PolizaPaginaState createState() => _PolizaPaginaState();


  
}

class _PolizaPaginaState extends State<PolizaPagina> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StoreConnector<AppEstado, AppEstado>(
            converter: (almacen) => almacen.state,
            builder: (context, AppEstado appEstado) {
              return _crearPagina(appEstado);
            }));
  }

  _crearPagina(AppEstado appEstado) {
    return Scaffold(
      appBar: _crearAppBar(),
      body: _crearBody(appEstado),
      floatingActionButton: _crearBoton(appEstado),
    );
  }

  _crearAppBar() {
    return AppBar(title: Text("Polizas"));
  }

  _crearBody(AppEstado appEstado) {
    List<Poliza> lst = appEstado.polizas;
    return ListView.builder(
      itemCount: lst.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        title: Text(lst[index].asegurado),
      ),
    );
  }

  _crearBoton(AppEstado appEstado) {
    return FloatingActionButton(
      child: Icon(Icons.home),
      onPressed: () {
         widget.obtenerPoliza(context);
      },
    );
  }


}
