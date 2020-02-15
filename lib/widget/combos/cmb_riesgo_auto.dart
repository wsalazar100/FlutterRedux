import 'package:appdosinteligente/constantes/interface.dart';
import 'package:appdosinteligente/modelo/riesgo_auto.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CmbRiesgoAuto extends StatefulWidget {
  List<RiesgoAutoModel> riesgos;
  List<DropdownMenuItem<RiesgoAutoModel>> menuItems;
  final Function onTomaValor;

  CmbRiesgoAuto({this.riesgos, this.onTomaValor}) {
    menuItems = buildDropDownMenuItems(riesgos);
  }

  List<DropdownMenuItem<RiesgoAutoModel>> buildDropDownMenuItems(
      List<RiesgoAutoModel> riesgos) {
    List<DropdownMenuItem<RiesgoAutoModel>> items = List();

    // agregar seleccione
    items.add(_itemDefault());
    
    // agregar elementos
    riesgos.forEach((r) {
      String des =  r.marca.trim() + " " + r.modelo.trim() + " " + r.anio.toString();
      items.add(DropdownMenuItem(
        value: r,
        child: Text(des),
      ));
    });

    return items;
  }

  _itemDefault() {
      
      return (DropdownMenuItem(
        value: new RiesgoAutoModel(),
        child: Text('seleccione'),
      ));

  }
  @override
  _CmbRiesgoAutoState createState() => _CmbRiesgoAutoState();
}

class _CmbRiesgoAutoState extends State<CmbRiesgoAuto> {
  RiesgoAutoModel riesgoSel;

  onCambioItem(RiesgoAutoModel sel) {
    widget.onTomaValor(sel);
    setState(() {
      riesgoSel = sel;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: _crearDropDown()
    );
  }

  // _crearIcono() {
  //   return Icon(Icons.select_all);
  // }

  // _crearDropDownOld() {
  //   return DropdownButton(
  //     style: TEXTO_COMBO,
  //     isExpanded: true,
  //     value: riesgoSel,
  //     items: widget.menuItems,
  //     onChanged: onCambioItem,
  //   );
  // }

  _crearDropDown() {
 
    return Container(
        padding: EdgeInsets.symmetric(horizontal:15.0),
        child: Column(children: <Widget>[
          DropdownButton(
            iconEnabledColor: Colors.pink,
            style: TEXTO_COMBO,
            isExpanded: true,
            value: riesgoSel,
            items: widget.menuItems,
            onChanged: onCambioItem,
          )
        ]));
  }
} // fin widget
