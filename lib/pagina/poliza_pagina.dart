
import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/modelo/poliza_model.dart';

import 'package:appdosinteligente/redux/acciones_middleware.dart';

import 'package:appdosinteligente/tema/poliza_estilo.dart';
import 'package:appdosinteligente/util/interfase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';



class PolizaPagina extends StatefulWidget {
  final void Function() onInit;

  PolizaPagina({this.onInit});

  // acciones
  obtenerPoliza(context) {
    StoreProvider.of<AppEstado>(context).dispatch(obtenerPolizaAccion);
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
        leading: Icon(icon),
        title: Text(s),
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
      headerChild,
      getNavItem(Icons.person, "Login", "/"),
      getNavItem(Icons.folder_open, "Poliza", "/poliza"),
      getNavItem(Icons.local_hospital, "Emergencia", "/emergencia"),
      getNavItem(Icons.map, "Localizacion", "/localizacion"),
      getNavItem(Icons.notifications, "Notificacion", "/notificacion"),
      getNavItem(Icons.people, "Proveedores", "/proveedor"),
      getNavItem(Icons.chat, "Chatear con asistente", "/asistente"),
      getNavItem(Icons.account_circle, "Configuracion", "/configuracion"),
      getNavItem(Icons.close, "Salir", "/salida"),

       nosotrosChild
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }


    ListTile _crearOpcion(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon, color: Colors.pinkAccent),
        title: Text(s),
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


  _crearAppBar() {
    return AppBar(title: Text("Polizas"));
  }

  _crearBody(AppEstado appEstado) {
    List<Poliza> lst = appEstado.polizas;
    return Stack(
      children: <Widget>[
        crearGradientePagina(),
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
          height: 100,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Nro de Poliza: ${poliza.nroPol.toString()}',
                  style: tituloPoliza,
                ),
                Text(
                  'Vigencia: ${poliza.fecVigDesde} - ${poliza.fecVigHasta} ',
                  style: tituloVigencia,
                ),
                Text('Asegurado: ${poliza.asegurado}'),
                Text('Ramo: ${poliza.ramo}'),
              ])),
    ));
  }

  _crearBoton(AppEstado appEstado) {
    return FloatingActionButton.extended(
      label: Text('Refrescar'),
      icon: Icon(Icons.search),
      backgroundColor: Colors.pink,
      onPressed: () {
        widget.obtenerPoliza(context);
      },
    );
  }
}
