import 'package:appdosinteligente/modelo/ubicacion_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// PROVEEDOR
  const    CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

   const  CameraPosition CONS_POSICION_INICIAL = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

 UbicacionModel CONS_UBICACION_INICIAL = UbicacionModel(idubicacion:0,descripcion:'ubicacion inicial', lat: 37.43296265331129, lon:-122.08832357078792 );  


