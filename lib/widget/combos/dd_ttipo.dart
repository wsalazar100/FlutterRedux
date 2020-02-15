
import 'package:appdosinteligente/constantes/interface.dart';
import 'package:flutter/material.dart';

class DDTTipo extends StatelessWidget {
  final List tipos;
  final String tabla;
  final Function onCambioItem;
  final tipoSel;

  DDTTipo({this.tipos, this.tabla, this.onCambioItem, this.tipoSel});

  List<DropdownMenuItem> contruyeDropDown( List tipos, String tabla) {
    List<DropdownMenuItem> elementos = [];

    if (tipos.length > 0)
      tipos.forEach((t) {
        elementos.add(DropdownMenuItem(
          value: t,
          child: Text(obtieneDescripcion(tabla,t)),
        ));
      });

    return elementos;
  }
  String obtieneDescripcion(String tipo, dynamic t ) {
    String descripcion='';
    switch (tipo) {
      case 'tcausa':
        { descripcion = t.idCausa.toString() + ' - ' + t.causa.toString(); }
        break;
      case '':
        { descripcion = '';}
        break;
    }

    return descripcion;
  }
  
  
_crearDropDown() {
    return  Padding(
      padding:  EdgeInsets.all(15.0),
      child: DropdownButton(
        
        style: TEXTO_COMBO,
        isExpanded: true,
        value: tipoSel,
        items: contruyeDropDown(tipos,tabla),
        onChanged: onCambioItem,
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
       width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: _crearDropDown()
        ),
    );
  }



}