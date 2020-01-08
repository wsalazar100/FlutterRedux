

import 'package:flutter/material.dart';


const colorIcono = Colors.white;
const tamanio = 40.0;

Icon getIcono(String nombre) {

  switch (nombre) {
    case "home":
          return Icon(Icons.home, color: colorIcono, size: tamanio,);
    
    case "add_a_photo":
          return Icon(Icons.add_a_photo, color: colorIcono, size: tamanio,);

    case "monetization_on":
          return Icon(Icons.monetization_on, color: colorIcono, size: tamanio,);
    
    case "add_alert ":
          return Icon(Icons.add_alert , color: colorIcono, size: tamanio,);

    case "add_call ":
          return Icon(Icons.add_call , color: colorIcono, size: tamanio,);

    case "add_location":
          return Icon(Icons.add_location, color: colorIcono, size: tamanio,);

    //
    case "assignment":
          return Icon(Icons.assignment , color: colorIcono, size: tamanio,);                                        
    
    //
    case "attach_file":
          return Icon(Icons.attach_file, color: colorIcono, size: tamanio,);  

    //
    case "attach_money":
          return Icon(Icons.attach_money, color: colorIcono, size: tamanio,);                                        

    case "backup":
          return Icon(Icons.backup , color: colorIcono, size: tamanio,);  


    //
    case "block":
          return Icon(Icons.block , color: colorIcono, size: tamanio,);                                        

    //
    case "camera_alt":
          return Icon(Icons.camera_alt , color: colorIcono, size: tamanio,);  

    case "chat":
          return Icon(Icons.chat , color: colorIcono, size: tamanio,);                                        

    case "credit_card":
          return Icon(Icons.credit_card, color: colorIcono, size: tamanio,);  

    case "delete_forever":
          return Icon(Icons.delete_forever, color: colorIcono, size: tamanio,);  
          

    case "drive_eta":
          return Icon(Icons.drive_eta , color: colorIcono, size: tamanio,); 


    case "edit":
          return Icon(Icons.edit, color: colorIcono, size: tamanio,); 


    case "email":
          return Icon(Icons.email , color: colorIcono, size: tamanio,); 


    case "folder_open":
          return Icon(Icons.folder_open , color: colorIcono, size: tamanio,); 

    case "local_hospital":
          return Icon(Icons.local_hospital  , color: colorIcono, size: tamanio,); 

    case "local_library":
          return Icon(Icons.local_library   , color: colorIcono, size: tamanio,); 

    case "location_on":
          return Icon(Icons.location_on   , color: colorIcono, size: tamanio,); 

    case "map":
          return Icon(Icons.map    , color: colorIcono, size: tamanio,); 

    case "note":
          return Icon(Icons.note    , color: colorIcono, size: tamanio,); 

    // cancelar
    case "pan_tool":
          return Icon(Icons.pan_tool     , color: colorIcono, size: tamanio,); 

    default:
         return Icon(Icons.pan_tool , color: colorIcono, size: tamanio,); 
  }
}

 crearGradientePagina() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset(0.0, 0.6),
                    end: FractionalOffset(0.0, 1.0),
                    colors: [ 
                      Color.fromRGBO(52,54, 101, 1.0), 
                      Color.fromRGBO(35,37, 101, 1.0)]
                  )
      )
    );
  }

_crearFondoPagina() {
  
    return  Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.black
          // image: DecorationImage(
          //   image: AssetImage("assets/images/fondoCia2.jpg"),
          //   fit: BoxFit.cover,
          // ),
        ),
    );

  }

