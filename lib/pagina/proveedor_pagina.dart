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
  Set<Marker> marcasMapa = {};
  ProveedorPagina({this.onInit});
  Completer<GoogleMapController> _mapaCtr = Completer();

   obtenerProveedor(context)    {
         StoreProvider.of<AppEstado>(context).dispatch(obtenerProveedorAccion);

          //_ubicacionMarca(context);
  }

  obtenerUbicacion(context) async {
         await StoreProvider.of<AppEstado>(context).dispatch(obtenerUbicacionAccion);
  }
 
  Future<void> _ubicacionMarca(Marker marca) async {
    

    final GoogleMapController controller = await _mapaCtr.future;

    CameraPosition posicionCamara = CameraPosition(
      target: LatLng(marca.position.latitude, marca.position.longitude),
      zoom: 14.0);

    controller.animateCamera(CameraUpdate.newCameraPosition(posicionCamara));

  }


  @override
  _ProveedorPaginaState createState() => _ProveedorPaginaState();
}

class _ProveedorPaginaState extends State<ProveedorPagina> {


  



  // // @override
  void initState() {
    super.initState();
       WidgetsBinding.instance
        .addPostFrameCallback((_) => widget.obtenerProveedor(context));
 
       //obtenerUbicacion();
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

obtenerMarcasMapa(List<ProveedorModel> lst) {
   Set<Marker> lstMarcas = {};
   Marker  ultimaMarca;
  lst.forEach((proveedor)  {
      Marker  marcaX =   Marker(
          markerId: MarkerId(proveedor.idproveedor.toString()),
          infoWindow: InfoWindow(title: proveedor.proveedor, snippet: proveedor.proveedor),
          draggable: true,
          icon: BitmapDescriptor.defaultMarker,
          onTap: () {

          },
          position: LatLng( proveedor.lat, proveedor.lon)
        );  

        //lstMarcas.add(marcaX);
        widget.marcasMapa.add(marcaX);
        ultimaMarca=marcaX;
    

  });

  //ubica la ultima marca
  if (lst.length>0) {
    // marcasMapa = lstMarcas;
    // _ubicacionMarca(ultimaMarca);
  }
     


  return widget.marcasMapa;

}
  _crearPagina(AppEstado appEstado) {
    return Scaffold(
      appBar: _crearAppBar(),
      body: _crearBody(appEstado),
      floatingActionButton: Container(
        height: 60,
        width: double.infinity,
        child: Column(
        children: <Widget>[
              // _botonPosicionActual(appEstado),
          _botonConsultaProveedor(appEstado)
        ],
      ))
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


  _botonPosicionActual(AppEstado appEstado)  {
    return FloatingActionButton.extended(
        label: Text('Mi posicion'),
        icon: Icon(Icons.map),
        backgroundColor: Colors.pink,
        onPressed: () async {
           await widget.obtenerUbicacion(context);   
           await _ubicacionActual(appEstado);

        },
      );
  }

  _botonConsultaProveedor(AppEstado appEstado)  {
    return FloatingActionButton.extended(
        label: Text('Buscar proveedor'),
        icon: Icon(Icons.search),
        backgroundColor: Colors.pink,
        onPressed: ()   {
            widget.obtenerProveedor(context);
          
        },
      );
  }


Future<void> _ubicacionActual(AppEstado appEstado) async {
    

    final GoogleMapController controller = await widget._mapaCtr.future;

    CameraPosition posicionCamara = CameraPosition(
      target: LatLng(appEstado.ubicacion.lat, appEstado.ubicacion.lon),
      zoom: 19.151926040649414);

    controller.animateCamera(CameraUpdate.newCameraPosition(posicionCamara));

    // marca
    print('Ubicacion Actual ======> ');
    print(appEstado.ubicacion);
    widget.marcasMapa.add(obtnerMarcaDesdeUbicacion(appEstado.ubicacion));
     print(widget.marcasMapa);
  }





  CameraPosition getPosicion(AppEstado appEstado){

    return CameraPosition(
      target: LatLng(appEstado.ubicacion.lat, appEstado.ubicacion.lon),
      zoom: 14.0);
  }
  

  _crearBody(AppEstado appEstado)  {
    
   
    // if (lstMarcas.length>0) 
    //     _ubicacionMarca(lstMarcas.toList()[0]);
    
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CONS_POSICION_INICIAL,
          markers:  obtenerMarcasMapa(appEstado.proveedores),
          onMapCreated: (GoogleMapController controller) { 
            widget._mapaCtr.complete(controller);
          },
        ) 
        ); 
      
  }
} // fin


