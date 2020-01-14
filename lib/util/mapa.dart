  import 'package:appdosinteligente/modelo/proveedor_model.dart';
import 'package:appdosinteligente/modelo/ubicacion_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

obtenerMarcasMapa(List<ProveedorModel> lst) {
   Set<Marker> lstMarcas = {};

  lst.forEach((proveedor)  {
  var marcaX =   Marker(
      markerId: MarkerId(proveedor.idproveedor.toString()),
      draggable: true,
      icon: BitmapDescriptor.defaultMarker,
      onTap: () {
        print('presione ${proveedor.proveedor}');
      },
      position: LatLng( proveedor.lat, proveedor.lon)
    );  

    lstMarcas.add(marcaX);
  });
  return lstMarcas;

}

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

     