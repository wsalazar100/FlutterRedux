import 'package:flutter/material.dart';

class NotificacionPagina extends StatefulWidget {
  NotificacionPagina({Key key}) : super(key: key);

  @override
  _NotificacionPaginaState createState() => _NotificacionPaginaState();
}

class _NotificacionPaginaState extends State<NotificacionPagina> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("Notificaciones"),
    );
  }
}