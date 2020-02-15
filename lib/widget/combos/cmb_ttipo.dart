import 'package:appdosinteligente/constantes/interface.dart';
import 'package:flutter/material.dart';

class CmbTTipo extends StatefulWidget {
  final List tipos;
  final String tabla;
  final Function onTomaValor;
  dynamic tipoSel;
  List<DropdownMenuItem> items;

  CmbTTipo({this.tipos, this.tabla, this.tipoSel,this.onTomaValor }) {
    items = contruyeDropDown(tipos,tabla);
  } 
  
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

  @override
  _CmbTTipoState createState() => _CmbTTipoState();
}

class _CmbTTipoState extends State<CmbTTipo> {
 dynamic tipoSel;
  


  onCambioItem(sel) async  {
    widget.onTomaValor(sel);

    setState(() {
      tipoSel = sel;
      print('Usted selecciono CAUSA ====> ');
      print(sel.causa);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
          // color: Color(COLOR_FONDO_ICON_BUTTON),
          borderRadius: BorderRadius.circular(30)
          ),

      alignment: Alignment.topCenter,
       width: double.infinity,
      child:  _crearDropDown()
    );
  }

_crearDropDown() {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15),
      child: DropdownButton(
        iconEnabledColor: Colors.pink,
        style: TEXTO_COMBO,
        isExpanded: true,
        value: tipoSel,
        items: widget.items,
        onChanged: onCambioItem,
      ),
    );
  }





} // fin widget
