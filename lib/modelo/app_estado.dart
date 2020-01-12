
import 'package:appdosinteligente/modelo/notificacion_model.dart';
import 'package:appdosinteligente/modelo/parametro_model.dart';
import 'package:appdosinteligente/modelo/poliza_model.dart';
import 'package:appdosinteligente/modelo/usuario_modelo.dart';
import 'package:flutter/material.dart';

import 'menu_model.dart';

class EstadoInicial {
   List<Poliza> polizas = [new Poliza(asegurado: "No definido")];
   List<Menu> menus = [new Menu(titulo: "No definido")];
   UsuarioModel usuario = new UsuarioModel();
   ParametroConsulta parametroConsulta = new ParametroConsulta(200);
   List<NotificacionModel> notificaciones = [new NotificacionModel()];
}

class AppEstado {
  List<Poliza> polizas;
  List<Menu> menus;
  ParametroConsulta parametroConsulta;
  UsuarioModel usuario;
  List<NotificacionModel> notificaciones;


  AppEstado({@required EstadoInicial estadoInicial}) {
      this.polizas = estadoInicial.polizas;
      this.menus = estadoInicial.menus;
      this.parametroConsulta = estadoInicial.parametroConsulta;
      this.usuario = estadoInicial.usuario;
      this.notificaciones = estadoInicial.notificaciones;
  }


  AppEstado.desdeAppEstado(AppEstado otroEstado) {
    polizas = otroEstado.polizas;
    menus = otroEstado.menus;
    parametroConsulta = otroEstado.parametroConsulta;
    usuario = otroEstado.usuario;
    notificaciones = otroEstado.notificaciones;
  }

  
}