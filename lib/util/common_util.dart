

import 'package:beautysquare/util/logger_util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommonUtil {

  factory CommonUtil() {
    return _singleton;
  }

  static final CommonUtil _singleton = CommonUtil._internal();
  CommonUtil._internal() {
       print("Instance created CommonUtil");
  }


   void keyboardHide(BuildContext context) {
     FocusScope.of(context).requestFocus(FocusNode());
     //FocusScope.of(context).unfocus();
   }

  String currentDate(String from) {
    var now = new DateTime.now();
    var date;
    if(from == "revers")
     date = new DateFormat("yyyy-MM-dd").format(now);
    else
      date = new DateFormat("dd-MM-yyyy").format(now);
    return date.toString();
  }
  String currentTime() {
    var now = new DateTime.now();
    var time = new DateFormat("H:m:s").format(now);
    return time.toString();
  }
  String currentDateTimeMilli() {
    var now = new DateTime.now();
     return now.millisecondsSinceEpoch.toString();
  }
  String currentDateTime() {
    var now = new DateTime.now();
    var time = new DateFormat("dd-MM-yyyy hh:mm:ss").format(now);
    return time.toString();
  }



  String dateFormater(String data) {
    final frt = new DateFormat('dd-MM-yyyy');
    var datas =  DateFormat("yyyy/MM/dd").parse(data);
     var mydate =  frt.format(datas);
    return mydate.toString();
  }
}