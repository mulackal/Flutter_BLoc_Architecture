import 'package:flutter/material.dart';

class CommonHeaderPlane extends StatelessWidget {

  final String _text;
  final String _bold;
  final double _font_size;
  final IconData _icons;

  CommonHeaderPlane(this._text,this._bold,this._font_size,this._icons);

  @override
  Widget build(BuildContext context) {
  return  Material(
    elevation: 0.0,
    borderRadius: BorderRadius.all(Radius.circular(1.0)),
    color: Colors.orangeAccent,
    child:  Container(
      padding: EdgeInsets.only(left: 10.0),
      height: 40.0,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

           Icon(_icons,
            color: Colors.white,
          ),

           SizedBox(width: 10.0,),

           Text(_text,
            style: new TextStyle(fontSize: _font_size,color: Colors.white,
            fontWeight: _bold == 'bold' ?  FontWeight.bold : FontWeight.normal),
            textAlign: TextAlign.center,),

        ],
      ),
    ),
  );
  }
}