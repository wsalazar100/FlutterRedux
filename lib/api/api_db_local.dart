import 'dart:io';

import 'package:appdosinteligente/modelo/notificacion_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';





class ApiDBLocal {

  static Database _database; 
  static final ApiDBLocal db = ApiDBLocal._();

  ApiDBLocal._();

  Future<Database> get database async {

    if ( _database != null ) return _database;

    _database = await initDB();
    return _database;
  }


  initDB() async {

    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join( documentsDirectory.path, 'NotificacionDB.db' );
    print('directorio bdd ========> : ${documentsDirectory.path}');
    return await openDatabase(
      path,
      version: 2,
      onOpen: (db) {},
      onCreate: ( Database db, int version ) async {
        await db.execute(
          ' CREATE TABLE Notificacion ('
          ' idnotificacion INTEGER PRIMARY KEY AUTOINCREMENT,'
          ' titulo TEXT   ,'
          ' cuerpo TEXT   ,'
          ' fecha TEXT    ,'
          ' descripcion TEXT  ,'
          ' pagina TEXT'
          ' )'
        );
      }
    
    );

  }

  // CREAR Registros
  nuevaNotiRaw( NotificacionModel nuevaNoti ) async {

    final db  = await database;

    final res = await db.rawInsert(
      "INSERT Into Notificacion ( titulo, cuerpo, fecha, descripcion, pagina) "
      "VALUES ( '${ nuevaNoti.titulo }', '${ nuevaNoti.cuerpo }', '${ nuevaNoti.fecha }', '${ nuevaNoti.descripcion }', '${ nuevaNoti.pagina }' )"
    );
    return res;

  }

  nuevaNoti( NotificacionModel nuevaNoti ) async {

    final db  = await database;
    final res = await db.insert('Notificacion',  nuevaNoti.toJson() );
    return res;
  }


  // SELECT - Obtener información
  Future<NotificacionModel> getNotificacionId( int id ) async {

    final db  = await database;
    final res = await db.query('Notificacion', where: 'idnotificacion = ?', whereArgs: [id]  );
    return res.isNotEmpty ? NotificacionModel.fromJson( res.first ) : null;

  }

  Future<List<NotificacionModel>> getTodosNotificacion() async {

    final db  = await database;
    final res = await db.query('Notificacion');

    List<NotificacionModel> list = res.isNotEmpty 
                              ? res.map( (c) => NotificacionModel.fromJson(c) ).toList()
                              : [];
    return list;
  }



  // Actualizar Registros
  Future<int> updateNotificacion( NotificacionModel nuevaNoti ) async {

    final db  = await database;
    final res = await db.update('Notificacion', nuevaNoti.toJson(), where: 'id = ?', whereArgs: [nuevaNoti.idnotificacion] );
    return res;

  }

  // Eliminar registros
  Future<int> deleteNotificacion( int id ) async {

    final db  = await database;
    final res = await db.delete('Notificacion', where: 'idnotificacion = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAll() async {

    final db  = await database;
    final res = await db.rawDelete('DELETE FROM Notificacion');
    return res;
  }

}

