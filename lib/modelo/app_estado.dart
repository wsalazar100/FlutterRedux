
import 'package:appdosinteligente/modelo/poliza_model.dart';
import 'package:flutter/material.dart';

class AppEstado {
  List<Poliza> polizas;
  
  AppEstado({@required this.polizas});


  AppEstado.desdeAppEstado(AppEstado otroEstado) {
    polizas = otroEstado.polizas;
  }

  
}