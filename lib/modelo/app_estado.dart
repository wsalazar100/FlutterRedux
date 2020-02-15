
import 'package:appdosinteligente/constantes/mapa.dart';
import 'package:appdosinteligente/modelo/modelo_tipo/tusuario_model.dart';
import 'package:appdosinteligente/modelo/notificacion_model.dart';
import 'package:appdosinteligente/modelo/parametro_model.dart';
import 'package:appdosinteligente/modelo/poliza_model.dart';
import 'package:appdosinteligente/modelo/proveedor_model.dart';
import 'package:appdosinteligente/modelo/riesgo_auto.dart';
import 'package:appdosinteligente/modelo/ubicacion_model.dart';
import 'package:appdosinteligente/modelo/usuario_modelo.dart';
import 'package:appdosinteligente/modelo/video_model.dart';
import 'package:flutter/material.dart';

import 'menu_model.dart';
import 'modelo_tipo/tcausa_model.dart';

class EstadoInicial {
   List<Poliza> polizas = []; //[new Poliza(asegurado: "No definido")];
   List<Menu> menus = [new Menu(titulo: "No definido")];
   UsuarioModel usuario = new UsuarioModel();
   ParametroConsulta parametroConsulta = new ParametroConsulta(codAsegurado:200);
   List<NotificacionModel> notificaciones = [new NotificacionModel()];
   UbicacionModel ubicacion = CONS_UBICACION_INICIAL;
   List<ProveedorModel> proveedores= [];
   List<VideoModel> videos = [];
   List<RiesgoAutoModel> riesgoAutos = [];
   List<TCausaModel> tcausa = [];
   List<TUsuarioModel> tusuario = [];
}

class AppEstado {
  List<Poliza> polizas;
  List<Menu> menus;
  ParametroConsulta parametroConsulta;
  UsuarioModel usuario;
  List<NotificacionModel> notificaciones;
  UbicacionModel ubicacion;
  List<ProveedorModel> proveedores;
  List<VideoModel> videos;
  List<RiesgoAutoModel> riesgoAutos;
  List<TCausaModel> tcausa = [];
  List<TUsuarioModel> tusuario = [];
  
  AppEstado({@required EstadoInicial estadoInicial}) {
      this.polizas = estadoInicial.polizas;
      this.menus = estadoInicial.menus;
      this.parametroConsulta = estadoInicial.parametroConsulta;
      this.usuario = estadoInicial.usuario;
      this.notificaciones = estadoInicial.notificaciones;
      this.ubicacion = estadoInicial.ubicacion;
      this.proveedores = estadoInicial.proveedores;
      this.videos = estadoInicial.videos;
      this.riesgoAutos = estadoInicial.riesgoAutos;
      this.tcausa = estadoInicial.tcausa;
      this.tusuario = estadoInicial.tusuario;
  }


  AppEstado.desdeAppEstado(AppEstado otroEstado) {
    polizas = otroEstado.polizas;
    menus = otroEstado.menus;
    parametroConsulta = otroEstado.parametroConsulta;
    usuario = otroEstado.usuario;
    notificaciones = otroEstado.notificaciones;
    ubicacion = otroEstado.ubicacion;
    proveedores = otroEstado.proveedores;
    videos = otroEstado.videos;
    riesgoAutos = otroEstado.riesgoAutos;
    tcausa = otroEstado.tcausa;
  }

  
}