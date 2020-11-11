import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {

  final String _text;
  final String _bold;
  final Color _color;
  final Function _fn;

  CommonButton(this._text,this._bold,this._color,this._fn);

  @override
  Widget build(BuildContext context) {
  return Container(
    height: 45.0,
    margin: EdgeInsets.all(10),
    child: RaisedButton(
      onPressed: _fn,
      color: Colors.blue,


      /*shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),*/
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
    /*  shape: StadiumBorder(),*/
    /*  shape: OutlineInputBorder(),*/

      /*shape: CircleBorder(side: BorderSide(
          color: Colors.black, width: 1.0,style: BorderStyle.solid)
      ),*/

     /* shape: Border.all(width: 2.0, color: Colors.redAccent),*/

      padding: EdgeInsets.all(0.0),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            _text,
            textAlign: TextAlign.center,
            style: new TextStyle(fontSize: 14.0,color: _color,
                fontWeight: _bold == 'bold' ?  FontWeight.bold : FontWeight.normal),
          ),
        ),

    ),
  );
  }
}