import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/tema/poliza_estilo.dart';
import 'package:appdosinteligente/widget/campo_texto_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class UsuarioPagina extends StatefulWidget {
  @override
  _UsuarioPaginaState createState() => _UsuarioPaginaState();
}

class _UsuarioPaginaState extends State<UsuarioPagina> {
  final _frmClave = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StoreConnector<AppEstado, AppEstado>(
            converter: (almacen) => almacen.state,
            builder: (context, AppEstado appEstado) {
              return _crearPagina(context, appEstado);
            }));
  }

  _crearPagina(BuildContext context, AppEstado appEstado) {
    return Scaffold(
      appBar: _crearAppBar(),
      body: _crearBody(context, appEstado),
      floatingActionButton: _crearBoton(appEstado),
    );
  }

  _crearAppBar() {
    return AppBar(title: Text("Configuración de Usuario"));
  }

  _crearBody(BuildContext context, AppEstado appEstado) {
    return Container(
        // decoration: _crearFondoPagina(),
        child: frmUsuario(context, appEstado));
  }

  _crearBoton(AppEstado appEstado) {
    return FloatingActionButton.extended(
      label: Text('Grabar'),
      icon: Icon(Icons.search),
      backgroundColor: Colors.pink,
      onPressed: () {},
    );
  } // fin

  frmUsuario(BuildContext context, AppEstado appEstado) {
    final mitad = MediaQuery.of(context).size.width / 2.0;

    return Form(
        key: _frmClave,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CampoTexto(
                hintText: "Nombre",
              ),
              CampoTexto(
                hintText: "Correo",
                isEmail: true,
              ),
              CampoTexto(
                hintText: "Dirección",
              ),
              CampoTexto(
                hintText: "Celular",
              ),
              CampoTexto(
                hintText: "Nro Documento",
              ),
              CampoTexto(
                hintText: "Nro Tarjeta",
              ),
              CampoTexto(
                hintText: "Puntos",
              ),
              _creartarjeta("assets/images/tarjeta_supermaxy.jpg"),

              _botonGrabar()
            ],
          ),
        ));
  }

  _botonGrabar() {
    return RaisedButton(
        onPressed: () {},
        color: Colors.blueAccent,
        child: Text(
          'Grabar',
          style: botonGrabar,
        ));
  }

  _creartarjeta(String foto) {
  return Container(
    height: 145,
    width: 225,
    child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(foto, fit: BoxFit.cover)),
  );
  }
}
