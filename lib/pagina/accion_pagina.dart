import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/modelo/poliza_model.dart';
import 'package:appdosinteligente/tema/poliza_estilo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AccionPagina extends StatefulWidget {
  AccionPagina({Key key}) : super(key: key);

  @override
  _AccionPaginaState createState() => _AccionPaginaState();
}

class _AccionPaginaState extends State<AccionPagina> {
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
      
    );
  }

  _crearAppBar() {
    return AppBar(title: Text("Poliza nro: "));
  }

  _crearBody(AppEstado appEstado) {
    List<Poliza> lst = appEstado.polizas;
    return ListView.builder(
      itemCount: lst.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        title: _crearCard(lst[index]) //Text(lst[index].asegurado),
      ),
    );
  }

  _crearCard(Poliza poliza) {
      return Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.pushNamed(context, '/accion');
              print('Card tapped.');
            },
            child: Container(
            padding: EdgeInsets.all(15),
            width: 300,
            height: 100,
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                  Text('Nro de Poliza: ${poliza.nroPol.toString()}',  style: tituloPoliza,),
                  Text('Vigencia: ${poliza.fecVigDesde} - ${poliza.fecVigHasta} ', style: tituloVigencia, ),
                  Text('Asegurado: ${poliza.asegurado}'),
                  Text('Ramo: ${poliza.ramo}'),
                  
            ]
               )
          ),
          )
      );
  }




} // fin