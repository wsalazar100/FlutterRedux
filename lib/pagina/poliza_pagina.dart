import 'package:appdosinteligente/constantes/interface.dart';
import 'package:appdosinteligente/datos/datos_prueba.dart';
import 'package:appdosinteligente/modelo/app_estado.dart';

import 'package:appdosinteligente/modelo/poliza_model.dart';

import 'package:appdosinteligente/redux/acciones_middleware.dart';

import 'package:appdosinteligente/tema/poliza_estilo.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class PolizaPagina extends StatefulWidget {
  final void Function() onInit;

  PolizaPagina({this.onInit});

  // acciones
  obtenerPoliza(context) {
    StoreProvider.of<AppEstado>(context).dispatch(obtenerPolizaAccion);
  }

  getPolizaPorAsegurado(context, parametroConsulta) {
    StoreProvider.of<AppEstado>(context)
        .dispatch(getPolizaPorAseguradoAccion(parametroConsulta));
  }

  obtenerMenu(context) {
    StoreProvider.of<AppEstado>(context).dispatch(obtenerMenuAccion);
  }

  @override
  _PolizaPaginaState createState() => _PolizaPaginaState();
}

class _PolizaPaginaState extends State<PolizaPagina> {
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => widget.obtenerPoliza(context));
  
  
  }

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
      drawer: _crearLateral(context),
      body: _crearBody(appEstado),
      floatingActionButton: _crearBoton(appEstado),
    );
  }

  Drawer _crearLateral(BuildContext context) {
    var headerChild = DrawerHeader(child: Text("Seguro Inteligente"));
    var nosotrosChild = AboutListTile(
        child: Text("Nosostros"),
        applicationName: "Seguro Inteligente",
        applicationVersion: "v1.0.0",
        applicationIcon: Icon(Icons.adb),
        icon: Icon(Icons.info));

    ListTile getNavItem(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon, size: 35, color: Colors.black),
        title: Text(
          s,
          style: itemLateral,
        ),
        onTap: () {
          setState(() {
            // pop closes the drawer
            Navigator.of(context).pop();
            // navigate to the route
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      // headerChild,
      SizedBox(
        height: 60,
      ),
      getNavItem(Icons.person, "Login", "/"),
      getNavItem(Icons.folder_open, "Poliza", "/poliza"),
      // getNavItem(Icons.local_hospital, "Emergencia", "/emergencia"),
      getNavItem(Icons.map, "Localizacion", "/localizacion"),
      getNavItem(Icons.notifications, "Notificacion", "/notificacion"),
      getNavItem(Icons.people, "Proveedores", "/proveedor"),
      getNavItem(Icons.people, "Videos", "/video"),
      // getNavItem(Icons.chat, "Chatear con asistente", "/asistente"),
      getNavItem(Icons.account_circle, "Configuracion", "/configuracion"),
          getNavItem(Icons.account_circle, "Pre-Reclamo", "/prereclamo"),
      getNavItem(Icons.close, "Salir", "/salida"),

      //  nosotrosChild
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
        child: Container(decoration: _crearFondoLateral(), child: listView));
  }

  _crearFondoLateral() {
    return BoxDecoration(
        image: new DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/fondo_lateral.jpg')));
  }

  _crearFondoPagina() {
    return BoxDecoration(
        image: new DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/fondo_pagina.jpg')));
  }

  _crearAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text("Polizas"));
  }

  _crearBody(AppEstado appEstado) {
    List<Poliza> lst = appEstado.polizas;
    return Container(
      decoration: _crearFondoPagina(),
      child: _crearContenido(appEstado.polizas),
    );
  }

  _crearContenido(List<Poliza> lst) {
    return Stack(
      children: <Widget>[
        // crearGradientePagina(),
        ListView.builder(
          itemCount: lst.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
              title: _crearCard(lst[index]) //Text(lst[index].asegurado),
              ),
        )
      ],
    );
  }

  _crearCard(Poliza poliza) {
    return Card(
        child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        // widget.obtenerMenu(context);
        Navigator.pushNamed(context, '/accion', arguments: poliza);
        print('Presiono Poliza.');
      },
      child: Container(
          padding: EdgeInsets.all(15),
          width: 300,
          height: 200,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: <Widget>[
                _crearDetalle(poliza),
                SizedBox(height: 20.0,),
                _crearIconos(poliza),
              ])),
    ));
  }

  _crearDetalle(Poliza poliza) {
    return Container(
      alignment: Alignment.centerLeft,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Nro de Poliza: ${poliza.nroPoliza.toString()}',
            style: tituloCard,
          ),
          SizedBox(height: 10.0,),
          Text(
            'Vigencia: ${poliza.fecDesde} - ${poliza.fecHasta} ',
            style: tituloVigencia,
          ),
          Text('Broker: ${poliza.broker}'),
          Text('Ramo: ${poliza.ramo}'),
        ],
      ),
    );
  }

  _crearIconos(Poliza poliza) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _crearIconoPDF(poliza),
        _crearIconoVideo(poliza),
        _crearIconoTelefono(poliza),
        _crearIconoReclamo(poliza),


      ],
    );
  }

  _crearIconoPDF(Poliza poliza) {
    return Container(
      decoration: BoxDecoration(
          color: Color(COLOR_FONDO_ICON_BUTTON),
          borderRadius: BorderRadius.circular(30)),
      child: IconButton(
        icon: Icon(Icons.file_download, color: Colors.pink),
        tooltip: 'Abrir PDF de la poliza',
        onPressed: () async {
          String url =
              "https://www.chubb.com/ec-es/_assets/documents/condiciones-generales-poliza-de-seguro-de-vehiculos.pdf";
          await launch(url);
        },
      ),
    );
  }
 

  _crearIconoTelefono(Poliza poliza) {
    return Container(
      decoration: BoxDecoration(
          color: Color(COLOR_FONDO_ICON_BUTTON),
          borderRadius: BorderRadius.circular(30)),
      child: IconButton(
        icon: Icon(Icons.phone, color: Colors.pink),
        tooltip: 'Llamar a la cia de seguros',
        onPressed: () async {
          String telefono = "tel:0999222692";
          await launch(telefono);
        },
      ),
    );
  }

  _crearIconoReclamo(Poliza poliza) {
    return Container(
      decoration: BoxDecoration(
          color: Color(COLOR_FONDO_ICON_BUTTON),
          borderRadius: BorderRadius.circular(BORDER_RADIUS_BUTTON)),
      child: IconButton(
        icon: Icon(Icons.mood_bad, color: Colors.pink),
        tooltip: 'Notificar el siniestro a la compania',
        onPressed: () async {
          Navigator.pushNamed(context, '/prereclamo', arguments: poliza);
        },
      ),
    );
  }

  
  _crearIconoVideo(Poliza poliza) {
    return Container(
      decoration: BoxDecoration(
          color: Color(COLOR_FONDO_ICON_BUTTON),
          borderRadius: BorderRadius.circular(30)),
      child: IconButton(
        icon: Icon(Icons.videocam, color: Colors.pink),
        tooltip: 'Abrir video explicación de la poliza',
        onPressed: () async {
          String url = "https://www.youtube.com/watch?v=t6kZf9LrXEE";
          await launch(url);
        },
      ),
    );
  }

  _crearBoton(AppEstado appEstado) {
    return FloatingActionButton.extended(
      label: Text('Refrescar'),
      icon: Icon(Icons.search),
      backgroundColor: Colors.pink,
      onPressed: () {
        //widget.getPolizaPorAsegurado(context,new ParametroConsulta(100));

        widget.obtenerPoliza(context);

        StoreProvider.of<AppEstado>(context)
            .dispatch(agregarNotificacionAccion(notificacionPrueba));
      },
    );
  } // fin

}
