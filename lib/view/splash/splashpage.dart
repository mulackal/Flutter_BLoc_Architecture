
import 'package:beautysquare/styles/colors.dart';

import 'package:beautysquare/util/screen_argument.dart';
import 'package:beautysquare/util/screen_text_util.dart';
import 'package:beautysquare/util/shared_Preference_manager.dart';
import 'package:beautysquare/view/login/login_pages_block.dart';
import 'package:beautysquare/view/news/news_pages.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';


import 'dart:async';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

   /* Timer(new Duration(seconds: 5), () =>
        Navigator.of(context).pushReplacementNamed(NewsPage.routeName,));*/
   /* Timer(new Duration(seconds: 5), () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => NewsPage())));*/

    navigate();

  }


  navigate() async {
    try {

      /* SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setBool(Constant().isLogin, false);*/

      Timer(new Duration(seconds: 1), () {
      if (SharedPreferenceManager().getLogin() ?? false) {
        Timer(new Duration(seconds: 5), () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => NewsPage())));
        print("splash = loades");
      }
      else {
        /** send argument**/
        Timer(new Duration(seconds: 5), () =>
            Navigator.of(context).pushReplacementNamed(
                LoginPagesBlock.routeName));
         // arguments: ScreenArguments(title: "LoginPage")

        print("splash = not loades");
      }
    });

    }catch(e){
    print(e.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    final screeSize = MediaQuery
        .of(context)
        .size;
    ScreenSizeTextUtil().updateScreenDimesion(
        width: screeSize.width, height: screeSize.height);

    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(color: colorStyles['sky_blue']),
            ),
            new Container(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Image.asset(
                          'assets/images/bsqlogo.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
