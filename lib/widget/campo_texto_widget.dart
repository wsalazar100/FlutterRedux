import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController ctr;

  CampoTexto(
      {
      this.hintText,
      this.validator,
      this.onSaved,
      this.isPassword=false,
      this.isEmail=false,
      this.ctr,
      
      });

  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {


  @override
  void dispose() {
    widget.ctr.dispose();
    super.dispose();
  }
  
  onGraba(valor) async {
    

   setState(() {
      widget.onSaved(valor);
      print('calor del campo');
      print(valor);
    });


  }


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextFormField(
            controller: widget.ctr,
            obscureText: widget.isPassword ? true : false,
            keyboardType: 
                widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
            validator: widget.validator,
            onSaved: onGraba,
            decoration: InputDecoration(
              labelText: widget.hintText,
              
              //hintText: hintText,
              contentPadding: EdgeInsets.all(15.0),
              border:  OutlineInputBorder( borderRadius: BorderRadius.circular(20)),
              filled: true,
              // fillColor: Colors.pink[200],
            ),
          )),
    );
  }
}
