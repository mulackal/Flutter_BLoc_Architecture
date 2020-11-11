import 'package:flutter/material.dart';

class CustomPageTransitionBuilder extends PageTransitionsBuilder {
 @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {

 /*   if (route.settings.isInitialRoute) {
      return child;
    }*/

    return SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}