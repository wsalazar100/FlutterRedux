import 'package:appdosinteligente/modelo/poliza_model.dart';

class ApiDB {
  
   obtenerPoliza()  async {
     List<Poliza> polizas = [new Poliza(asegurado: "Maria del Carmen Castillo"), new Poliza(asegurado: "Olivia Castillo")];
     return polizas;
   }

}