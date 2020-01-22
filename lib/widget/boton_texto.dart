
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const tituloEnlace =  TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal);

class IconTexto extends StatelessWidget {
  final String titulo;
  final String url;
  final Icon icon;

  IconTexto({@required this.titulo,@required this.url, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:Row(children: <Widget>[
       IconButton(
        icon: this.icon, 
        onPressed: () async {
           String url = this.url;
           await launch(url);
        },
      ),
      Text(titulo, style: tituloEnlace,)
      ],)
    );
  }
}