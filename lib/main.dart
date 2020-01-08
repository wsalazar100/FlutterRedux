import 'package:appdosinteligente/pagina/accion_pagina.dart';
import 'package:appdosinteligente/pagina/login_pagina.dart';
import 'package:appdosinteligente/pagina/poliza_pagina.dart';

import 'package:appdosinteligente/redux/reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'modelo/app_estado.dart';


void main() { 
  EstadoInicial estadoInicial = new EstadoInicial();


  final AppEstado _inicialEstado = new AppEstado(estadoInicial: estadoInicial);
  final Store<AppEstado> _almacen =  new Store<AppEstado>(reducer, initialState: _inicialEstado, middleware: [thunkMiddleware]);
  runApp(MyApp(_almacen));

  //  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Store<AppEstado> almacen;
  MyApp(this.almacen);
  @override
  Widget build(BuildContext context) {
       return StoreProvider<AppEstado>(
        store: almacen,
        child: _crearApp(),    
    );
  }


_crearApp() {
    return MaterialApp(
      title: 'Seguro Inteligente',
    
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPagina(),
        '/poliza': (context) => PolizaPagina(
          onInit: (){
              //StoreProvider.of<AppEstado>(context).dispatch(obtenerPolizaAccion);
          }

        ),
        '/accion': (context) => AccionPagina(),
        
      },

    );
  }
}
