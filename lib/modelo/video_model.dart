// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

import 'dart:convert';

VideoModel videoModelFromJson(String str) => VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
    String idVideo;
    String urlVideo;
    String fotoAvatar;
    String qrAvatar;
    String fotoPremio;
    int puntosPremio;
    String pregunta;
    String respuesta;
    int puntoPregunta;

    VideoModel({
        this.idVideo,
        this.urlVideo,
        this.fotoAvatar,
        this.qrAvatar,
        this.fotoPremio,
        this.puntosPremio,
        this.pregunta,
        this.respuesta,
        this.puntoPregunta,
    });

    factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        idVideo: json["idVideo"],
        urlVideo: json["urlVideo"],
        fotoAvatar: json["fotoAvatar"],
        qrAvatar: json["qrAvatar"],
        fotoPremio: json["fotoPremio"],
        puntosPremio: json["puntosPremio"],
        pregunta: json["pregunta"],
        respuesta: json["respuesta"],
        puntoPregunta: json["puntoPregunta"],
    );

    Map<String, dynamic> toJson() => {
        "idVideo": idVideo,
        "urlVideo": urlVideo,
        "fotoAvatar": fotoAvatar,
        "qrAvatar": qrAvatar,
        "fotoPremio": fotoPremio,
        "puntosPremio": puntosPremio,
        "pregunta": pregunta,
        "respuesta": respuesta,
        "puntoPregunta": puntoPregunta,
    };
}


class VideosModel {
  List<VideoModel> items = new List<VideoModel>();

  VideosModel();
  VideosModel.fromJsonList( List<dynamic> jsonList  ) { 
    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final VideoModel video = new VideoModel.fromJson(item);
      items.add( video );
    }
   }


 VideosModel.fromMapa( Map<String, dynamic> mapa  ) { 
    if ( mapa == null ) return ;

    mapa.forEach((id,pol) {
      final VideoModel video = new VideoModel.fromJson(pol);

      items.add( video );
    });
    
   }


}



