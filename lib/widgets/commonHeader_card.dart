import 'package:flutter/material.dart';

class CommonHeaderCard extends StatelessWidget {

  final String _text;
  final String _bold;
  final double _font_size;

  CommonHeaderCard(this._text,this._bold,this._font_size);

  @override
  Widget build(BuildContext context) {
  return   Card(
    elevation: 1.0,
    shadowColor: Colors.grey,
    color: Colors.blue,
    child:   Container(
    padding: EdgeInsets.only(left: 10.0),
    height: 40.0,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
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