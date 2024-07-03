
import 'package:flutter/material.dart';
import 'package:thepointapp/src/views/page/loginPage.dart';
import 'package:thepointapp/src/views/page/phonePage.dart';
import 'package:thepointapp/src/views/page/sendPage.dart';
import 'package:thepointapp/src/views/page/sessionPage.dart';
import 'package:thepointapp/src/views/page/splashPage.dart';

class RouteManager {
  static const String loadingPage = '/';
  static const String loginPage = '/loginPage';
  static const String sessionPage = '/sessionPage';
  static const String phonePage = '/phonePage';
  static const String sendPage = '/sendPage';

  static Route<dynamic> onGenerationRoute(RouteSettings setting) {
    switch(setting.name) {
      case loadingPage:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case loginPage:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case sessionPage:
        return MaterialPageRoute(builder: (context) => SessionPage());
      case phonePage:
        return MaterialPageRoute(builder: (context) => PhonePage());
      case sendPage:
        return MaterialPageRoute(builder: (context) => SendPage());
      default:
        throw Exception('No route found!');
    }
  }
}