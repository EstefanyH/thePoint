
import 'package:flutter/material.dart';
import 'package:thepointapp/src/views/page/loginPage.dart';
import 'package:thepointapp/src/views/page/sessionPage.dart';
import 'package:thepointapp/src/views/page/splashPage.dart';

class RouteManager {
  static const String loadingPage = '/';
  static const String loginPage = '/loginPage';
  static const String sessionPage = '/sessionPage';

  static Route<dynamic> onGenerationRoute(RouteSettings setting) {
    switch(setting.name) {
      case loadingPage:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case loginPage:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case sessionPage:
        return MaterialPageRoute(builder: (context) => SessionPage());
      default:
        throw Exception('No route found!');
    }
  }
}