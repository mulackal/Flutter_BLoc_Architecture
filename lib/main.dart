
import 'package:beautysquare/styles/colors.dart';
import 'package:beautysquare/util/custom_pagination.dart';
import 'package:beautysquare/util/logger_util.dart';
import 'package:beautysquare/util/resource_string.dart';
import 'package:beautysquare/util/shared_Preference_manager.dart';
import 'package:beautysquare/view/login/login_pages_block.dart';
import 'package:beautysquare/view/splash/splashpage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Block/app_bloc_delegate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;

  /** BlocSupervisor oversees Blocs and delegates to BlocDelegate.
      BlocDelegate handles events from all Blocs which are delegated by the BlocSupervisor.
      Can be used to intercept all Bloc events, transitions, and errors.
      It is a great way to handle logging/analytics as well as error handling universally.**/
  BlocSupervisor.delegate = AppBlocDelegate();
  
  var routes = <String, WidgetBuilder>{
    "/splash": (BuildContext context) =>  SplashScreen(),
    "/login": (BuildContext context) => new LoginPagesBlock(),
  };

  config();

  runApp(
      MaterialApp(
      title: 'Template BLOC ',
      debugShowCheckedModeBanner: false,

        theme: ThemeData(
          primarySwatch: colorStyles['primary_dark'],
          accentColor: colorStyles['primary'],
          brightness: Brightness.light,
          primaryColor: colorStyles['primary'],
          primaryColorBrightness: Brightness.light,
          accentColorBrightness: Brightness.light,
          fontFamily: 'Lato',
          textTheme: ThemeData.light().textTheme.copyWith(
             bodyText1 : TextStyle(
                fontSize: 15,
                fontFamily: 'Lato',
                color: colorStyles['black'],
              ),
              bodyText2:  TextStyle(
                fontSize: 14,
                fontFamily: 'Lato',
                color: colorStyles['black'],
              ),
              subtitle1: TextStyle(
                fontSize: 17,
                fontFamily: 'Lato',
                color: colorStyles['black'],
              ),
            headline1: TextStyle(
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
           headline2: TextStyle(
                fontSize: 18,
                fontFamily: 'Lato',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
              TargetPlatform.iOS: CustomPageTransitionBuilder(),
            },
          ),
      ),
      home: SplashScreen(),
      routes: routes,
      // ignore: missing_return
      onGenerateRoute: (settings) {
          print(settings.arguments);
      },
      onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (ctx) => SplashScreen(),
          );
      },
      ),
      );
}

void config() {

/** load resource strings **/
  ResourceString();
  /** load util logger **/
  LoggerUtil();
  /** set shared preference**/
  SharedPreferenceManager();
  /** set device orientation**/
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
}
