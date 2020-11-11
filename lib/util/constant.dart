


class Constant {

  factory Constant() {
    return _singleton;
  }

  static final Constant _singleton = Constant._internal();
  Constant._internal() {
    print("Instance created Constant");
  }


  static const String appname = "I-Abide";

   String get accessToken => "access_token";
   String get isLogin => "islogin";
   String get currentLanguage => "language";

}