
import 'package:appdosinteligente/modelo/poliza_model.dart';
import 'package:flutter/material.dart';

import 'menu_model.dart';

class EstadoInicial {
   List<Poliza> polizas = [new Poliza(asegurado: "No definido")];
   List<Menu> menus = [new Menu(titulo: "No definido")];
}

class AppEstado {
  List<Poliza> polizas;
  List<Menu> menus;

  AppEstado({@required EstadoInicial estadoInicial}) {
      this.polizas = estadoInicial.polizas;
      this.menus = estadoInicial.menus;
  }


  AppEstado.desdeAppEstado(AppEstado otroEstado) {
    polizas = otroEstado.polizas;
    menus = otroEstado.menus;
  }

  
}