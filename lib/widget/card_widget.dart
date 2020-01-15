import 'package:appdosinteligente/modelo/video_model.dart';
import 'package:appdosinteligente/tema/poliza_estilo.dart';
import 'package:flutter/material.dart';

class CardPremio extends StatelessWidget {
  final VideoModel video;
  CardPremio({@required this.video});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          height: 500,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _crearTitulo('Puntos Meta: ${video.puntosPremio}'),
                // _crearAvatar(video.fotoAvatar),
                _crearAvatar(video.fotoPremio),
                _crearSubTitulo('Puntos: ${video.puntosPremio}'),
                _crearMensaje('1.- pesa la funda con tus bottelas para otener el ticket con el peso'),
                _crearMensaje('2.- scanea el ticket para ganar puntos'),
                _crearMensaje('3.- canjea tus punto por premio en cualquie supermaxy'),
                _botonScan("scanea el codigo qr con el peso"),
              ]))
    );
  }
}

_crearTitulo(String titulo) {
  return Text(
    titulo,
    style: tituloCard,
    textAlign: TextAlign.right,
  );
}

_crearSubTitulo(String subTitulo) {
  return Text(
    subTitulo,
    style: subtituloCard,
    textAlign: TextAlign.right,
  );
}
_crearMensaje(String mensaje) {
  return Text(
    mensaje,
    style: subtituloCard,
    textAlign: TextAlign.right,
  );
}

_botonScan(String ayuda){
  return IconButton(
    focusColor: Colors.green,
    color: Colors.pink,
    iconSize: 40.0,
    tooltip: ayuda ,
    onPressed: (){ print('premio scan');},
    icon: Icon(Icons.camera_alt,)
  );
}

_crearAvatar(String foto) {
  return Container(
    height: 240,
    width: 120,
    child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(foto, fit: BoxFit.cover)),
  );

  
}
