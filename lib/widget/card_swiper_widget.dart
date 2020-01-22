import 'package:appdosinteligente/modelo/video_model.dart';
import 'package:appdosinteligente/tema/poliza_estilo.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatefulWidget {
  List<VideoModel> videos;

  CardSwiper({@required this.videos});

  @override
  _CardSwiperState createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {
  bool _mostrarPremio = false;

  @override
  Widget build(BuildContext context) {
    final _pantalla = MediaQuery.of(context).size;
    return  Swiper(
      layout: SwiperLayout.DEFAULT,
      itemHeight: 500, // _pantalla.height * 0.5,
      itemWidth: 400, //_pantalla.width * 0.8,
      viewportFraction: 0.8,
      scale: 0.9,
      itemCount: widget.videos.length,
      itemBuilder: (BuildContext context, index) {
        return Column(
          children: <Widget>[
        
            _crearTitulo(widget.videos[index]),
            // _imagenAvatar(widget.videos[index]),
            _imagenPremio(widget.videos[index]),
            _botonScan('Scanea el codigo del premio'),
           
          ],
        );
        //  return Image.network("http://via.placeholder.com/350x250",fit: BoxFit.fill);
      },
    );
  }

  _crearTitulo(VideoModel video) {
    return Text(
      ' Puntos meta: ${video.puntosPremio.toString()}',
      style: tituloPuntosPremio,
    );
    // return Text(' Iagen : ${video.fotoPremio}', style: tituloPuntosPremio,);
  }

  Widget _imagen(VideoModel video) {
    if (_mostrarPremio)
      return _imagenPremio(video);
    else
      return _imagenAvatar(video);
  }

  _imagenAvatar(VideoModel video) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(video.fotoAvatar, fit: BoxFit.fill));
  }

  _imagenPremio(VideoModel video) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(video.fotoPremio, fit: BoxFit.cover));
  }
_botonScan(String ayuda){
  return IconButton(
    focusColor: Colors.green,
    color: Colors.pink,
    iconSize: 40.0,
    tooltip: ayuda ,
    onPressed: _scaneaCodigo,
    icon: Icon(Icons.camera_alt,)
  );
}
_scaneaCodigo() async {
  String codigo='';
  try {
    codigo = await BarcodeScanner.scan();
    print('codigo $codigo');
  } catch (e) {
      print("Error en scaneaCodigo :${e.toString()} " );
  }
}


} //fin
