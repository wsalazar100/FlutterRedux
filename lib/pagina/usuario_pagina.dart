import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/modelo/modelo_tipo/tusuario_model.dart';
import 'package:appdosinteligente/modelo/parametro_model.dart';
import 'package:appdosinteligente/redux/acciones_middleware.dart';
import 'package:appdosinteligente/tema/poliza_estilo.dart';
import 'package:appdosinteligente/widget/campo_texto_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class UsuarioPagina extends StatefulWidget {
  
  obtenerUsuarioPorId(context, parametroConsulta) {
    StoreProvider.of<AppEstado>(context)
        .dispatch(obtenerUsuarioPorIdAccion(parametroConsulta));
  }

  @override
  _UsuarioPaginaState createState() => _UsuarioPaginaState();
}

class _UsuarioPaginaState extends State<UsuarioPagina> {
  final _frmClave = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ParametroConsulta parametroConsulta = new ParametroConsulta();
    parametroConsulta.idUsuario = 1; 
    widget.obtenerUsuarioPorId(context, parametroConsulta);
  
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
      icon: Icon(Icons.save),
      backgroundColor: Colors.pink,
      onPressed: () {},
    );
  } // fin

  frmUsuario(BuildContext context, AppEstado appEstado) {
    final mitad = MediaQuery.of(context).size.width / 2.0;
    final TextEditingController ctrNombre = TextEditingController();
    final TextEditingController ctrCorreo = TextEditingController();
    final TextEditingController ctrDireccion = TextEditingController();
    final TextEditingController ctrCelular = TextEditingController();
    final TextEditingController ctrDocumento = TextEditingController();


    TUsuarioModel usuario = new TUsuarioModel();
    usuario = (appEstado.tusuario!=null && appEstado.tusuario.length>0) ? appEstado.tusuario[0] : new TUsuarioModel();
    ctrNombre.text = usuario.nombreCompleto;
    return Form(
        key: _frmClave,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _creartarjeta("assets/images/tarjeta_supermaxy.jpg"),
    
              CampoTexto(
                hintText: "Nombre",
                ctr: ctrNombre
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
              // CampoTexto(
              //   hintText: "Nro Tarjeta",
              // ),
              // CampoTexto(
              //   hintText: "Puntos",
              // ),
              

              // _botonGrabar()
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
    height: 150,
    width: double.infinity,
    child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(foto, fit: BoxFit.cover)),
  );
  }
}
