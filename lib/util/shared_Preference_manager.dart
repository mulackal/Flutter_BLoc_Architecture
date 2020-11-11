
import 'package:shared_preferences/shared_preferences.dart';


import 'constant.dart';

class SharedPreferenceManager {

  factory SharedPreferenceManager() {
    return _singleton;
  }

  SharedPreferences _sharedPreferencesss;

  static final SharedPreferenceManager _singleton = SharedPreferenceManager._internal();
  SharedPreferenceManager._internal()  {
    setSharedValue();
    print("Instance created SharedPreferenceManager");
  }

  void setSharedValue() async {
    _sharedPreferencesss =  await SharedPreferences.getInstance();
    print("Instance created SharedPreference");
  }


//set data into shared preferences like this
  void setAuthToken(String auth_token) {
    _sharedPreferencesss.setString(Constant().accessToken, auth_token);
  }
//get value from shared preferences
  String getAuthToken() {
    String auth_token = _sharedPreferencesss.getString(Constant().accessToken) ?? "";
    return auth_token;
  }
  void removeAuthToken() {
     _sharedPreferencesss.remove(Constant().accessToken);
    }

//set data into shared preferences like this
void setLogin(bool login) {
  _sharedPreferencesss.setBool(Constant().isLogin, login);
}
//get value from shared preferences
bool getLogin() {
  bool login = _sharedPreferencesss.getBool(Constant().isLogin) ?? false;
  return login;
}
void removeLogin() {
  _sharedPreferencesss.remove(Constant().isLogin);
}

}

