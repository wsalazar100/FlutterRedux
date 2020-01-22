import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/modelo/video_model.dart';
import 'package:appdosinteligente/redux/acciones_middleware.dart';
import 'package:appdosinteligente/tema/poliza_estilo.dart';
import 'package:appdosinteligente/widget/card_swiper_widget.dart';
import 'package:appdosinteligente/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:appdosinteligente/datos/datos_prueba.dart';

class VideoPagina extends StatefulWidget {
  VideoPagina({Key key}) : super(key: key);

  // acciones
  obtenerVideo(context) {
    StoreProvider.of<AppEstado>(context).dispatch(obtenerVideoAccion);
  }

  @override
  _VideoPaginaState createState() => _VideoPaginaState();
}

class _VideoPaginaState extends State<VideoPagina> {
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => widget.obtenerVideo(context));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StoreConnector<AppEstado, AppEstado>(
            converter: (almacen) => almacen.state,
            builder: (context, AppEstado appEstado) {
              return _crearPagina(context, appEstado);
            }));
  }

  _crearPagina(BuildContext context, AppEstado appEstado) {
    return Scaffold(appBar: _crearAppBar(), body: _crearBody(appEstado));
  }

  _crearAppBar() {
    return AppBar(title: Text("Premios"));
  }

  // _crearBodyOld(AppEstado appEstado) {
  //   List<VideoModel> lst = appEstado.videos;
  //   return Container(
  //     // decoration: _crearFondoPagina() ,
  //     child: SingleChildScrollView(
  //       child: Column(children: lst.map((video) => _crearCard(video)).toList()),
  //     ),
  //   );
  // }

  // _crearBodyold(AppEstado appEstado) {
  //   return _crearSwiper(appEstado);
  // }

  _crearBody(AppEstado appEstado) {
    List<VideoModel> lst = appEstado.videos;
    return lst.length>0?  CardSwiper(videos: lst): CircularProgressIndicator();
    // return  Container(
    //   height: double.infinity,
    //   width: double.infinity,
    //   child:  Column(
    //     children: <Widget>[
    //       lst.length>0?  CardSwiper(videos: lst): CircularProgressIndicator(),
    //     ],
    //   )
    // );
    // return Container();
  }

  
  // _crearBodyOld2(AppEstado appEstado) {
  //   // List<PremioModel> lst = lstPremios; //appEstado.videos;

  //   List<VideoModel> lst=appEstado.videos;
  //   print("===============================> almacen");

  //   print(appEstado.videos);
  //   return lst.length>0 ?
  //       Swiper (
  //       itemCount: 4,
  //       itemWidth: 300,
  //       itemHeight: 400,
  //       layout: SwiperLayout.STACK,
  //       viewportFraction: 0.8,
  //       scale: 0.9,
  //       itemBuilder: (BuildContext context, int index) {
  //         return _crearCardPremio(lst[index]);
  //       }) : CircularProgressIndicator();
  // }

  //   _crearCardPremio(VideoModel premio) {
  //    return Card(
  //      child: Column(children: <Widget>[
  //        Image.asset(premio.fotoPremio)
  //      ],),
  //    );
  // }

  // _crearCardPremioOld(PremioModel premio) {
  //    return Card(
  //      child: Column(children: <Widget>[
  //        Image.asset(premio.url)
  //      ],),
  //    );
  // }


  // Widget _crearCard(VideoModel video) {
  //   return Card(
  //     child: Container(
  //         padding: EdgeInsets.all(15),
  //         width: double.infinity,
  //         height: 500,
  //         child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: <Widget>[
  //               _crearTitulo('Puntos Meta: ${video.puntosPremio}'),
  //               // _crearAvatar(video.fotoAvatar),
  //               _crearAvatar(video.fotoPremio),
  //               // _crearSubTitulo('Puntos: ${video.puntosPremio}'),
  //               // _crearMensaje('1.- pesa la funda con tus bottelas para otener el ticket con el peso'),
  //               // _crearMensaje('2.- scanea el ticket para ganar puntos'),
  //               // _crearMensaje('3.- canjea tus punto por premio en cualquie supermaxy'),
  //               // _botonScan("scanea el codigo qr con el peso"),
  //             ]))
  //   );
  // }


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
_crearAvatar(String foto) {
  return Container(
    height: 240,
    width: 120,
    child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(foto, fit: BoxFit.cover)),
  );

  
}


} // fin
