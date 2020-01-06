import 'package:flutter/material.dart';

class AccionPagina extends StatefulWidget {
  AccionPagina({Key key}) : super(key: key);

  @override
  _AccionPaginaState createState() => _AccionPaginaState();
}

class _AccionPaginaState extends State<AccionPagina> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(child: Text("Accion")),
    );
  }
}