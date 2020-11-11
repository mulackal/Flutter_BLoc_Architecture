
class LoginData {
  String access_token;
  String name;
  String vehicle_no = "";
  String otp_verified;

  LoginData({this.access_token, this.name, this.vehicle_no, this.otp_verified});


  LoginData.fromJson(Map<String, dynamic> map)
      : access_token = map['access_token'],
        name = map['name'],
        vehicle_no = map['vehicle_no'],
        otp_verified = map['otp_verified'];
}


class LoginResponds {

  LoginData data;
  String message;
  String status;
  String error;


  LoginResponds({this.data, this.message, this.status});

  LoginResponds.fromJson(Map<String, dynamic> map)
      : status = map['status'],
        message = map['message'],
        data = LoginData.fromJson(map['data']),
        error = "";


  LoginResponds.withError(String errorValue)
      : data = LoginData(),
        error = errorValue;

}
