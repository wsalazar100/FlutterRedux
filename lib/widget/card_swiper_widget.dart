import 'package:appdosinteligente/modelo/video_model.dart';
import 'package:appdosinteligente/tema/poliza_estilo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatefulWidget {
  final List<VideoModel> videos;

  CardSwiper({@required this.videos});

  @override
  _CardSwiperState createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {
  bool _mostrarPremio=false;

  @override
  Widget build(BuildContext context) {
    final _pantalla = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Swiper(
          layout: SwiperLayout.STACK,
          itemHeight: _pantalla.height * 0.5,
          itemWidth: _pantalla.width * 0.8,
          itemCount: 3,
          itemBuilder: (BuildContext context, index) {
            //  return Image.network("https://bioweb.bio/galeria/ListaEspeciesPorFamilia/4/18364", fit: BoxFit.fill,);
            //return Image.asset(videos[index].fotoAvatar,fit: BoxFit.fill);
            return InkWell(
              onTap: (){
                 setState(() {
                   _mostrarPremio = !_mostrarPremio;
                 });
                 
                 },
              child: Column(
              children: <Widget>[
                _crearTitulo(widget.videos[index]),
                // _imagenAvatar(widget.videos[index]),
               _imagenPremio(widget.videos[index]),
              ],
            ),
            );
            //  return Image.network("http://via.placeholder.com/350x250",fit: BoxFit.fill);
          },
        ));
  }

  _crearTitulo(VideoModel video) {
    //return Text(' Puntos : ${video.puntosPremio.toString()}', style: tituloPuntosPremio,);
    return Text(' Iagen : ${video.fotoPremio}', style: tituloPuntosPremio,);
  }

 Widget _imagen(VideoModel video) {
   
    if (_mostrarPremio )
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
        child: Image.asset(video.fotoPremio, fit: BoxFit.fill));
  }
}
