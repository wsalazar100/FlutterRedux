import 'package:flutter/material.dart';

class CampoFecha extends StatefulWidget {
  final String hintText;

  final Function validator;
  final Function onSaved;

  CampoFecha({
    this.hintText,
    this.validator,
    this.onSaved,
  });

  @override
  _CampoFechaState createState() => _CampoFechaState();
}

class _CampoFechaState extends State<CampoFecha> {
  // String _fechaSel='';
  DateTime _fechaSel = DateTime.now();
  TextEditingController _campoFechaCtr = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _campoFechaCtr,
            keyboardType: TextInputType.text,
            validator: widget.validator,
            onSaved: widget.onSaved,
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              _seleccionaFecha(context);
            },
            decoration: InputDecoration(
              labelText: widget.hintText,
              contentPadding: EdgeInsets.all(15.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              filled: true,
              // fillColor: Colors.grey[200],
            ),
          )),
    );
  }

void _seleccionaFecha(BuildContext context) async {

     DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2019),
      lastDate: new DateTime(2030),
    );


    if (picked != null) { 
        _fechaSel = picked;
        _campoFechaCtr.text = "${_fechaSel.toLocal()}".split(' ')[0];
        print('fecha seleccionada ' + _campoFechaCtr.text );
        widget.onSaved(_campoFechaCtr.text);
    }

}
}