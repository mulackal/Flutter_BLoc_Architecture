
import 'package:beautysquare/repository/api_provider.dart';
import 'package:beautysquare/repository/app_repository.dart';


class Injector {
  static final Injector _singleton = new Injector._internal();
  
    factory Injector() {
      return _singleton;
    }
  
    Injector._internal();

  AppRepository get myRepository => new ApiProvider();


}
