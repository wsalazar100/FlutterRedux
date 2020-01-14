import 'package:appdosinteligente/constantes/mapa.dart';
import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/modelo/proveedor_model.dart';
import 'package:appdosinteligente/redux/acciones.dart';
import 'package:appdosinteligente/redux/acciones_middleware.dart';
import 'package:appdosinteligente/util/mapa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class ProveedorPagina extends StatefulWidget {
  final void Function() onInit;

  ProveedorPagina({this.onInit});

  @override
  _ProveedorPaginaState createState() => _ProveedorPaginaState();
}

class _ProveedorPaginaState extends State<ProveedorPagina> {

  Completer<GoogleMapController> _mapaCtr = Completer();
  Set<Marker> marcasMapa = {};

  obtenerUbicacion() async {
         await StoreProvider.of<AppEstado>(context).dispatch(obtenerUbicacionAccion);
  }
  obtenerProveedor() {
         StoreProvider.of<AppEstado>(context).dispatch(obtenerProveedorAccion);
  }

  // // @override
  void initState() {
    super.initState();
    // obtenerUbicacion();
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
      body: _crearBody(appEstado),
      floatingActionButton: _crearBoton(appEstado),
    );
  }

  _crearAppBar() {
    return AppBar(title: Text("Ubicacion de Proveedores"));
  }

//  _crearBotonBuscar(AppEstado appEstado) {
//     return FloatingActionButton.extended(
//         onPressed: _goToTheLake(appEstado),
//         label: Text('To the lake!'),
//         icon: Icon(Icons.directions_boat),
//       );
//  }


  _crearBoton(AppEstado appEstado)  {
    return FloatingActionButton.extended(
        label: Text('Buscar proveedor'),
        icon: Icon(Icons.search),
        backgroundColor: Colors.pink,
        onPressed: () async {
           await obtenerUbicacion();   await _ubicacionActual(appEstado);

          // await obtenerProveedor();
          // marcasMapa = obtenerMarcasMapa(appEstado.proveedores);
          // await _ubicacionMarca(marcasMapa.first);

        },
      );
  }

Future<void> _ubicacionActual(AppEstado appEstado) async {
    

    final GoogleMapController controller = await _mapaCtr.future;

    CameraPosition posicionCamara = CameraPosition(
      target: LatLng(appEstado.ubicacion.lat, appEstado.ubicacion.lon),
      zoom: 19.151926040649414);

    controller.animateCamera(CameraUpdate.newCameraPosition(posicionCamara));

    // marca
    marcasMapa.add(obtnerMarcaDesdeUbicacion(appEstado.ubicacion));
  }

  Future<void> _ubicacionMarca(Marker marca) async {
    

    final GoogleMapController controller = await _mapaCtr.future;

    CameraPosition posicionCamara = CameraPosition(
      target: LatLng(marca.position.latitude, marca.position.longitude),
      zoom: 19.151926040649414);

    controller.animateCamera(CameraUpdate.newCameraPosition(posicionCamara));

  }



  CameraPosition getPosicion(AppEstado appEstado){

    return CameraPosition(
      target: LatLng(appEstado.ubicacion.lat, appEstado.ubicacion.lon),
      zoom: 19.151926040649414);
  }
  

  _crearBody(AppEstado appEstado) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CONS_POSICION_INICIAL,
          markers: marcasMapa,
          onMapCreated: (GoogleMapController controller) { 
            _mapaCtr.complete(controller);
          },
        ) 
        ); 
      
  }
} // fin