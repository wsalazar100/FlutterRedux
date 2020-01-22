
import 'package:appdosinteligente/modelo/ubicacion_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



obtnerMarcaDesdeUbicacion(UbicacionModel ubicacion) {
         return Marker(
      markerId: MarkerId(ubicacion.idubicacion.toString()),
      draggable: true,
      icon: BitmapDescriptor.defaultMarker,
      onTap: () {
        print('presione ${ubicacion.descripcion}');
      },
      position: LatLng( ubicacion.lat, ubicacion.lon)
    );  
 }


     