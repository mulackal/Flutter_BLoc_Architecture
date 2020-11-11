import 'package:flutter/material.dart';

class MyNavigator {

  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

  static void goToSplash(BuildContext context) {
    Navigator.pushNamed(context, "/splash");
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }

  static void goToOtp(BuildContext context) {
    Navigator.pushNamed(context, "/otp");
  }
  static void popUp(BuildContext context) {
    Navigator.pop(context);
  }
}
