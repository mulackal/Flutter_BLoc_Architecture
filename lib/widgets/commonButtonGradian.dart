import 'package:flutter/material.dart';

class CommonButtonGradian extends StatelessWidget {

  final String _text;
  final String _bold;
  final Color _color;
  final Function _fn;

  CommonButtonGradian(this._text,this._bold,this._color,this._fn);

  @override
  Widget build(BuildContext context) {
  return Container(
    height: 45.0,
    margin: EdgeInsets.all(10),
    child: RaisedButton(
      onPressed: _fn,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff374ABE), Color(0xff64B6FF)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          constraints:
          BoxConstraints(maxWidth: 250.0, minHeight: 45.0),
          alignment: Alignment.center,
          child: Text(
            _text,
            textAlign: TextAlign.center,
            style: new TextStyle(fontSize: 14.0,color: _color,
                fontWeight: _bold == 'bold' ?  FontWeight.bold : FontWeight.normal),
          ),
        ),
      ),
    ),
  );
  }
}