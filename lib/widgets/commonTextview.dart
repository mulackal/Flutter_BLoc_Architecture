import 'package:flutter/material.dart';

class CommonTextView extends StatelessWidget {

 // final bool _answer;
  final double _padding,_font_size;
  final String _text;
  final String _bold;
  final Color _color;

  CommonTextView(this._text,this._padding, this._font_size,this._bold,this._color);

  @override
  Widget build(BuildContext context) {
  return  new Container(
      padding:  EdgeInsets.all(_padding),

      child:  Row(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
           Text(_text ,
            textAlign: TextAlign.justify,
            style:  TextStyle(fontSize: _font_size,color: _color,fontWeight: _bold == 'bold' ?  FontWeight.bold : FontWeight.normal),)
        ],),);
  }
}