
import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/modelo/notificacion_model.dart';
import 'package:appdosinteligente/redux/acciones_middleware.dart';
import 'package:appdosinteligente/util/tiempo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class NotificacionPush {
   FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
   BuildContext _context;
   NotificacionPush(this._context) {
     initNotificacion();
   }
   initNotificacion() {
     // pedir permisos
     _firebaseMessaging.requestNotificationPermissions();

     // token de Firebase Cloud Messaging
    _firebaseMessaging.getToken().then((onToken){
        //print("Token FCM====> ");
        // er_K3JIPr40:APA91bHwzYEW3jIxUE6Y_codRxIkIRJw9IENRdcFtRCOCNAqEED-6e4rrtDxjjjps7X_SzzDvsJ_PfWV4UiTJz-FxhqYxQYZLyfMbofiQS0vlEH92r6d7MbkFtlVU8gvANKNjDsgCnJe
        //print(onToken);
    });


    _firebaseMessaging.configure(
       // cuando esta abierta
       onMessage: (infoMessage) async {

          print("====> onMessage ====>");
          print(infoMessage);
          NotificacionModel notificacion = new NotificacionModel();

          notificacion.fecha = getFechaActual(); 
          notificacion.titulo = infoMessage['title'];
          notificacion.cuerpo = infoMessage['body'];

          //click_action FLUTTER_NOTIFICATION_CLICK
          notificacion.descripcion = infoMessage['data']['descripcion'];
          notificacion.pagina = infoMessage['data']['pagina'];
          StoreProvider.of<AppEstado>(_context).dispatch(agregarNotificacionAccion(notificacion));
          Navigator.pushNamed(_context,  notificacion.pagina ); //, arguments: notificacion
          

       },
       // app en segundo plano
       onLaunch: ( infoLunch ) async {
          print("====> onLaunch ====>");
          print(infoLunch);

     
          NotificacionModel notificacion = new NotificacionModel();
          notificacion.titulo = infoLunch['title'];
          notificacion.cuerpo = infoLunch['body'];

          //click_action FLUTTER_NOTIFICATION_CLICK
          notificacion.descripcion = infoLunch['data']['descripcion'];
          StoreProvider.of<AppEstado>(_context).dispatch(agregarNotificacionAccion(notificacion));
          Navigator.pushNamed(_context, '/notificacion'); //, arguments: notificacion

          
       },

      onResume: ( infoResumen ) async { }
      //  onResume: ( infoResumen ) async {
      //     print("====> onResume ====>");
      //     print(infoResumen);


     
      //     NotificacionModel notificacion = new NotificacionModel();
      //     notificacion.titulo = infoResumen['title'];
      //     notificacion.cuerpo = infoResumen['body'];

      //     //click_action FLUTTER_NOTIFICATION_CLICK
      //     notificacion.descripcion = infoResumen['data']['descripcion'];
      //     StoreProvider.of<AppEstado>(_context).dispatch(agregarNotificacionAccion(notificacion));
      //     Navigator.pushNamed(_context, '/notificacion'); //, arguments: notificacion
      //  }

    );

   }
  
}