import 'package:appdosinteligente/datos/datos_prueba.dart';
import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/redux/acciones_middleware.dart';
import 'package:appdosinteligente/tema/poliza_estilo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:video_player/video_player.dart';
import 'package:appdosinteligente/constantes/textos.dart';
import 'package:appdosinteligente/widget/linea_texto_widget.dart';
import 'package:appdosinteligente/widget/boton_texto.dart';

class InicioPagina extends StatefulWidget {
  InicioPagina({Key key}) : super(key: key);

  @override
  _InicioPaginaState createState() => _InicioPaginaState();
}

class _InicioPaginaState extends State<InicioPagina> {
  VideoPlayerController _videoCtr;

  @override
  void initState() {
    super.initState();
    _videoCtr = VideoPlayerController.asset('assets/videos/flora.mp4')
      ..initialize().then((_) {
        print("inicializando video ====>");
        Duration inicioDuracion =
            new Duration(hours: 0, minutes: 0, seconds: 4);
        _videoCtr.seekTo(inicioDuracion);
        _videoCtr.setLooping(true);
        _videoCtr.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
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

  @override
  void dispose() {
    super.dispose();
    _videoCtr.dispose();
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
      // getNavItem(Icons.folder_open, "Poliza", "/poliza"),
      // getNavItem(Icons.local_hospital, "Emergencia", "/emergencia"),
      // getNavItem(Icons.map, "Localizacion", "/localizacion"),
      getNavItem(Icons.notifications, "Notificacion", "/notificacion"),
      getNavItem(Icons.track_changes, "Proceso", "/proceso"),

      getNavItem(Icons.people, "Proveedores", "/proveedor"),
      getNavItem(Icons.people, "Premios", "/video"),
      // getNavItem(Icons.chat, "Chatear con asistente", "/asistente"),
      getNavItem(Icons.account_circle, "Configuracion", "/configuracion"),
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
  //  _crearFondoPagina() {
  //     return BoxDecoration(
  //           image: new DecorationImage(
  //             fit: BoxFit.cover,
  //             image: AssetImage('assets/images/fondo_pagina.jpg'))
  //         );
  //  }

  _crearAppBar() {
    return AppBar(title: Text("Inicio"));
  }

  _crearBody(AppEstado appEstado) {
    return Container(
      decoration: _crearFondoPagina(),
      child: _crearContenido(appEstado),
    );
  }

  _crearContenido(AppEstado appEstado) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 350,),
          _videoCard(), 
          // _educaCard(), 
          _educaEnlace()],
        ));
  }

  _crearFondoPagina() {
    return BoxDecoration(
        image: new DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/fondo_animal.jpg')));
  }

  _videoCard() {
    return _videoCtr.value.initialized
        ? AspectRatio(
            aspectRatio: _videoCtr.value.aspectRatio,
            child: VideoPlayer(_videoCtr),
          )
        : Container();
  }

  _educaCard() {
    return Card(
      child: Container(
        width: double.infinity,
        child: Column(
        children: <Widget>[
          TituloTexto(titulo: t_0), LineaTexto(linea: p_0)
          ],
      ),
      )
    );
  }

  _educaEnlace() {
    return Card(
        child: Column(children: <Widget>[
      IconTexto(
          titulo: tituloEnlace_0,
          url: urlEnlace_0,
          icon: Icon(Icons.book, color: Colors.pink)),
      IconTexto(
          titulo: tituloEnlace_1,
          url: urlEnlace_1,
          icon: Icon(Icons.pan_tool, color: Colors.pink)),
      // IconTexto(
      //     titulo: tituloEnlace_2,
      //     url: urlEnlace_2,
      //     icon: Icon(Icons.people, color: Colors.pink)),
      // IconTexto(
      //     titulo: tituloEnlace_3,
      //     url: urlEnlace_3,
      //     icon: Icon(Icons.camera_enhance, color: Colors.pink)),
      // IconTexto(
      //     titulo: tituloEnlace_4,
      //     url: urlEnlace_4,
      //     icon: Icon(Icons.hotel, color: Colors.pink)),


    ]));
  }

  _crearBoton(AppEstado appEstado) {
    return FloatingActionButton.extended(
      label: Text('Refrescar'),
      icon: Icon(Icons.search),
      backgroundColor: Colors.pink,
      onPressed: () {
             StoreProvider.of<AppEstado>(context)
            .dispatch(agregarNotificacionAccion(notificacionPromocion));
      },
    );
  } // fin

} //fin
