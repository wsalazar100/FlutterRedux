import 'dart:ui';

import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/modelo/indice_modelo.dart';

import 'package:appdosinteligente/redux/acciones_middleware.dart';
import 'package:appdosinteligente/tema/poliza_estilo.dart';
import 'package:appdosinteligente/util/interfase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AccionPagina extends StatefulWidget {
  AccionPagina({Key key}) : super(key: key);
  // acciones
  obtenerMenu(context) {
     StoreProvider.of<AppEstado>(context).dispatch(obtenerMenuAccion);
  }

  @override
  _AccionPaginaState createState() => _AccionPaginaState();

}

class _AccionPaginaState extends State<AccionPagina> {
  
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => widget.obtenerMenu(context));
  }

  @override
  Widget build(BuildContext context) {

   return Container(
        child: StoreConnector<AppEstado, List<Menu>>(
            converter: (almacen) => almacen.state.menus,
            builder: (context, List<Menu> menus) {
              return _crearPagina(menus);
            }));
  
  }

  
  _crearPagina( List<Menu> menus) {
    final Poliza polizaPar = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: _crearAppBar(polizaPar),
      body: _crearBody(menus),
      
    );
  }

  _crearAppBar(Poliza poliza) {
    return AppBar(title: Text("Poliza nro: ${poliza.nroPoliza}"));
  }

  _crearBody(List<Menu> menus) {
    List<Menu> lst = menus;
    return _crearGrilla(lst);
  }

  _crearGrilla(List<Menu> menus) {
      return Stack(
         children: <Widget>[
           crearGradientePagina(),
            GridView.count(
                      crossAxisCount: 2,
                      children: _crearLista(menus)
                  ),

         ],
      );
  }
  



  

  List<Widget> _crearLista(List<Menu> menus){
     List<Widget> lst = new List<Widget>();
     menus.forEach((menu) => {
         lst.add( _crearBotonRedondo(menu) )
     });
     return lst;
  }

  _crearBotonRedondo( Menu menu) { 
      return Container(
          height: 150.0,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
             color: Color.fromRGBO(62, 66, 107, 0.7),
             borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
                SizedBox(height: 5,),
               _crearAvatar(menu),
               _crearTitulo(menu),
               SizedBox(height: 5,),
            ],
          ),
      );
}

_crearAvatar(Menu menu){
    return  CircleAvatar(
                  backgroundColor:  Colors.pinkAccent,
                   radius: 30.0,
                   child: getIcono(menu.icono),
                );
}

_crearTitulo(Menu menu){
    return Text( "${menu.titulo}", style: TextStyle(color: Colors.white),);
}

} // fin