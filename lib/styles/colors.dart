import 'package:flutter/material.dart';

Map<String, Color> colorStyles = {
  'primary_dark': MaterialColor(0xFF93cd48, const{
    50: Color.fromRGBO(147, 205, 72, .1),
    100: Color.fromRGBO(147, 205, 72, .2),
    200: Color.fromRGBO(147, 205, 72, .3),
    300: Color.fromRGBO(147, 205, 72, .4),
    400: Color.fromRGBO(147, 205, 72, .5),
    500: Color.fromRGBO(147, 205, 72, .6),
    600: Color.fromRGBO(147, 205, 72, .7),
    700: Color.fromRGBO(147, 205, 72, .8),
    800: Color.fromRGBO(147, 205, 72, .9),
    900: Color.fromRGBO(147, 205, 72, 1),
  }),

  'primary': Colors.purple,
  'light_font': Colors.white10,
  'gray': Colors.grey,
  'white': Colors.white,
  'black': Colors.black,
  'sky_blue': Color(0xFF42A5F5),
  'orange': Color(0xFFD56217),
  'green': Colors.green,

};
/*Color c = const Color(0xFF42A5F5);
  Color c = const Color.fromRGBO(66, 165, 245, 1.0);
  Color c1 = const Color(0xFFFFFF); // fully transparent white (invisible)
  Color c2 = const Color(0xFFFFFFFF); // fully opaque white (visible)*/