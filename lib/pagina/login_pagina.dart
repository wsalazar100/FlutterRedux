import 'package:appdosinteligente/modelo/app_estado.dart';
import 'package:appdosinteligente/modelo/usuario_modelo.dart';
import 'package:appdosinteligente/redux/acciones_middleware.dart';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class LoginPagina extends StatefulWidget {
  LoginPagina({Key key}) : super(key: key);



  @override
  _LoginPaginaState createState() => _LoginPaginaState();
}

class _LoginPaginaState extends State<LoginPagina> {
    AppEstado estado;
    loginUsuario(BuildContext context, LoginModel login) async {
       await StoreProvider.of<AppEstado>(context).dispatch(loginAccion(login));
    }


  @override
  Widget build(BuildContext context) {
    
    // Conectamos la pagina con el almacen
    return Container(
        child: StoreConnector<AppEstado, AppEstado>(
            converter: (almacen) => almacen.state,
            builder: (context, AppEstado appEstado) {
              estado = appEstado;
              return _crearPagina(context, appEstado);
            }));
  }

  _crearPagina(BuildContext context, AppEstado appEstado) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context),
      ],
    ));
  } // fin  _crearPagina

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoModaro = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0)
      ])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondoModaro,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
              SizedBox(height: 10.0, width: double.infinity),
              Text('Seguro Inteligente',
                  style: TextStyle(color: Colors.white, fontSize: 25.0))
            ],
          ),
        )
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final login = new LoginModel();
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _crearAreaSegura(),

          Container(
              width: size.width * 0.85,
              margin: EdgeInsets.symmetric(vertical: 30.0),
              padding: EdgeInsets.symmetric(vertical: 50.0),
              decoration: _crearDecoracionDeCaja(),
              child: _crearCampos(context, login)),

          //_crearBtnCuenta(),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  _crearDecoracionDeCaja() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 3.0,
              offset: Offset(0.0, 5.0),
              spreadRadius: 3.0)
        ]);
  }

  _crearAreaSegura() {
    return SafeArea(
      child: Container(
        height: 180.0,
      ),
    );
  }

  _crearCampos(BuildContext context, LoginModel login) {
    return Column(
      children: <Widget>[
        Text('Ingreso', style: TextStyle(fontSize: 20.0)),
        SizedBox(height: 60.0),
        _crearEmail(login),
        SizedBox(height: 30.0),
        _crearPassword(login),
        SizedBox(height: 30.0),
        _crearBoton(context, login)
      ],
    );
  }

  _crearBtnCuenta() {
    return FlatButton(
      child: Text('Crear una nueva cuenta'),
      onPressed: () => Navigator.pushReplacementNamed(context, 'registro'),
    );
  }

  Widget _crearEmail(LoginModel login) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
          hintText: 'ejemplo@correo.com',
          labelText: 'Correo electrónico',
          
        ),
        onChanged: (value) {
          login.usuario = value;
        },
      ),
    );
  }

  Widget _crearPassword(LoginModel login) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
          labelText: 'Contraseña',
        ),
        onChanged: (value) {
          login.password = value;
        },
      ),
    );
  }

  Widget _crearBotonOld(BuildContext context, LoginModel login) {
    return Container(
        child: StoreConnector<AppEstado, AppEstado>(
            converter: (almacen) => almacen.state,
            builder: (context, AppEstado appEstado) {
              return RaisedButton(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                  child: Text('Ingresar'),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 0.0,
                color: Colors.deepPurple,
                textColor: Colors.white,
                
                onPressed: () async {
                  print("Login esta autenticado");
                  print(appEstado.usuario.estaAutenticado);
                  
                  await loginUsuario(context, login);

                  
                  if (appEstado.usuario.estaAutenticado) {                      
                    print("Navegando hacia poliza");
                      Navigator.pushNamed(context, "/poliza"); }

                  else {
                     print ("Usuario NO autenticado ======>");
                     print(appEstado.usuario.mensaje);  
                  }
                     
                },
                // onPressed: snapshot.hasData ? ()=> _login(bloc, context) : null
              );
            }));
  }

  Widget _crearBoton(BuildContext context, LoginModel login) {
              return RaisedButton(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                  child: Text('Ingresar'),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 0.0,
                color: Colors.deepPurple,
                textColor: Colors.white,
                
                onPressed: () async {
                  print("Login esta autenticado");
                  print(estado.usuario.estaAutenticado);
                  
                  await loginUsuario(context, login);

                  
                  if (estado.usuario.estaAutenticado) {                      
                    print("Navegando hacia poliza");
                      Navigator.pushNamed(context, "/poliza"); }

                  else {
                     print ("Usuario NO autenticado ======>");
                     print(estado.usuario.mensaje);  
                  }
                     
                },
                // onPressed: snapshot.hasData ? ()=> _login(bloc, context) : null
              );

            
  }

}



