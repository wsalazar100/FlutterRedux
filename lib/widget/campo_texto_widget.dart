import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  CampoTexto(
      {this.hintText,
      this.validator,
      this.onSaved,
      this.isPassword=false,
      this.isEmail=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextFormField(
          
            obscureText: isPassword ? true : false,
            keyboardType:
                isEmail ? TextInputType.emailAddress : TextInputType.text,
            validator: validator,
            onSaved: onSaved,
            decoration: InputDecoration(
              // labelText: hintText,
              
              hintText: hintText,
              contentPadding: EdgeInsets.all(15.0),
              border:  InputBorder.none,
              filled: true,
              fillColor: Colors.grey[200],
            ),
          )),
    );
  }
}
