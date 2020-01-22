import 'package:flutter/material.dart';

const ESTILO_LINEA =  TextStyle(color: Colors.black, fontSize: 14);
const ESTILO_TITULO =  TextStyle(color: Colors.pink, fontSize: 16, fontWeight: FontWeight.bold );

class LineaTexto extends StatelessWidget {
  final String linea;
  LineaTexto({@required this.linea});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        linea,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style:ESTILO_LINEA ,)
    );
  }
}


class TituloTexto extends StatelessWidget {
  final String titulo;
  TituloTexto({@required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        titulo,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style:ESTILO_TITULO ,)
    );
  }
}