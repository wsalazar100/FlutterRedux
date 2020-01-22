
import 'package:appdosinteligente/constantes/interface.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProcesoPagina extends StatefulWidget {
  ProcesoPagina({Key key}) : super(key: key);

  @override
  _ProcesoPaginaState createState() => _ProcesoPaginaState();
}


class _ProcesoPaginaState extends State<ProcesoPagina> {
  int _pasoActual =0;
  bool _completo = false;

  List<Step> pasos = <Step>[
         Step(
      isActive: true,
      title: Text('Aprende como clasificar', style: TextStyle( color: Colors.pink),),
      content: _comoClasificar()
      ),
          Step(
      title: Text('Pesa tu funda de botellas recicladas'),
      content:  _comoPesar()
      ),
          Step(
      title: Text('Scanea el ticket del peso'),
      content: _botonScan('scanea el codigo de barras')
      ),
          Step(
      title: Text('Canjea tus puntos por premios'),
      content: _verPremios()
      ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       child: Stepper(
         currentStep: _pasoActual,
         onStepCancel:_cancelar,
         onStepContinue: _proximo,
         onStepTapped: (paso) => _pasarAl(paso),
         steps:  pasos,
       ),
    )
    );
  }

 static _botonScan(String ayuda){
  return IconButton(
    focusColor: Colors.green,
    color: Colors.pink,
    iconSize: 40.0,
    tooltip: ayuda ,
    onPressed: _scaneaCodigo,
    icon: Icon(Icons.camera_alt,)
  );
}
static _scaneaCodigo() async {
  String codigo='';
  try {
    codigo = await BarcodeScanner.scan();
    print('codigo $codigo');
  } catch (e) {
      print("Error en scaneaCodigo :${e.toString()} " );
  }
}




  _proximo(){
     _pasoActual + 1 != pasos.length ? _pasarAl( _pasoActual +1 ): setState(()=> _completo =true);
  }
  _pasarAl(int paso) {
    setState(() {
      _pasoActual = paso;
    });
  }
  _cancelar(){
    if (_pasoActual>0)
       _pasarAl(_pasoActual-1);
  }
  

  static _campoPeso(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Peso (Kg)'),

    );
  }

  static _comoClasificar(){
     return Container(
      decoration: BoxDecoration(
          color: Color(COLOR_FONDO_ICON_BUTTON),
          borderRadius: BorderRadius.circular(30)),
      child: IconButton(
        icon: Icon(Icons.videocam, color: Colors.pink),
        tooltip: 'te explicamos como clasificar los residuos.',
        onPressed: () async {
          String url = "https://www.youtube.com/watch?v=cmxgUNBzmzs";
          await launch(url);
        },
      ),
    );
  }

  static _comoPesar(){
     return Container(
      decoration: BoxDecoration(
          color: Color(COLOR_FONDO_ICON_BUTTON),
          borderRadius: BorderRadius.circular(30)),
      child: IconButton(
        icon: Icon(Icons.videocam, color: Colors.pink),
        tooltip: 'mira como pesar tu funda llena de botellas',
        onPressed: () async {
          String url = "https://www.youtube.com/watch?v=tg0QB2daL-o";
          await launch(url);
        },
      ),
    );
  }

  static _verPremios(){
       return Container(
      decoration: BoxDecoration(
          color: Color(COLOR_FONDO_ICON_BUTTON),
          borderRadius: BorderRadius.circular(30)),
      child: IconButton(
        icon: Icon(Icons.money_off, color: Colors.pink),
        tooltip: 'mira los premios que puedes ganar',
        onPressed: () async {
          //  Navigator.pushNamed(context, '/video');
        },
      ),
    );
  }

} //fin