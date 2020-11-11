
import 'package:flutter/material.dart';

class ScreenSizeTextUtil {

  factory ScreenSizeTextUtil() {
    return _singleton;
  }

  static final ScreenSizeTextUtil _singleton = ScreenSizeTextUtil._internal();
  ScreenSizeTextUtil._internal() {
    print("Instance created ScreenSizeTextUtil");
  }

//region Screen Size and Proportional according to device
  double _screenHeight;
  double _screenWidth;
  var _screenSize;

  double _loginbutton_hight = 40.0;
  double get loginButtonHight => _loginbutton_hight;

  double get screenHeight => _screenHeight;
  double get screenWidth => _screenWidth;
  Size get screenSize => _screenSize;

  final double _refrenceScreenHeight = 640;
  final double _refrenceScreenWidth = 360;

  void setScreenSize(final size) {
    _screenSize = (size != null) ? size : _screenSize;

    var hights = (25 * _screenHeight) / _refrenceScreenWidth;
    if(_loginbutton_hight < hights)
      _loginbutton_hight = hights;

  }
  void updateScreenDimesion({double width, double height}) {
    _screenWidth = (width != null) ? width : _screenWidth;
    _screenHeight = (height != null) ? height : _screenHeight;
  }
  double getProportionalHeight({double height}) {
    if (_screenHeight == null) return height;
    return _screenHeight * height / _refrenceScreenHeight;
  }
  double getProportionalWidth({double width}) {
    if (_screenWidth == null) return width;
    var w = _screenWidth * width / _refrenceScreenWidth;
    return w.ceilToDouble();
  }



//endregion
//region TextStyle
  TextStyle getTextStyleRegular(
       {String fontName = 'Lato',
        int fontsize = 12,
         Color color,
         FontWeight fontWeight,
        bool isChangeAccordingToDeviceSize = false,
        double characterSpacing,
        double lineSpacing}) {
    double finalFontsize = fontsize.toDouble();
    if (isChangeAccordingToDeviceSize && this._screenWidth != null) {
      finalFontsize = (finalFontsize * _screenWidth) / _refrenceScreenWidth;
    }
    if (characterSpacing != null) {
      return TextStyle(
          fontSize: finalFontsize,
          fontFamily: fontName,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: characterSpacing);
    } else if (lineSpacing != null) {
      return TextStyle(
          fontSize: finalFontsize,
          fontFamily: fontName,
          color: color,
          fontWeight: fontWeight,
          height: lineSpacing);
    }
    return TextStyle(
        fontSize: finalFontsize, fontFamily: fontName, color: color, fontWeight: fontWeight,);
  }
}