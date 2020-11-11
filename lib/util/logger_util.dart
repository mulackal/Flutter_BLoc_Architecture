
import 'package:logger/logger.dart';


class LoggerUtil {

  factory LoggerUtil() {
    return _singleton;
  }
  var logger;
  static final LoggerUtil _singleton = LoggerUtil._internal();
  LoggerUtil._internal() {
     logger = Logger();
       print("Instance created Logger");
  }


   void e(String key,dynamic data) {
     logger.e(key,data);
  }
  void d(String key,var data) {
    logger.d(key,data);
  }
  void v(String key,var data) {
    logger.v(key,data);
  }

}