import 'package:connectivity/connectivity.dart';

class NetworkChecking {

   static Future<bool> NetworkAvailable() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

   static dynamic isNetworkAvailable(Function function) {
     NetworkAvailable().then((intenet) {
       if (intenet != null && intenet) {
         function(true);
       }
       else{
         function(false);
       }
     });
   }
}