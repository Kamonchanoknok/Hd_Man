import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hd_man/screens/auth/index.dart';
import 'package:hd_man/screens/home/index.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/home':
        // if (args is String) {
        //   return MaterialPageRoute(
        //       builder: (context) => HomeScreen(
        //             data: args,
        //           ));
        // }

        return CupertinoPageRoute(builder: (context) => HomeScreen());

      case '/auth':
        return CupertinoPageRoute(builder: (context) => AuthScreen());
      default:
    }
  }
}
