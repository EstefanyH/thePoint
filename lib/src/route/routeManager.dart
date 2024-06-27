
import 'package:flutter/material.dart';
import 'package:thepointapp/src/views/page/loginPage.dart';
import 'package:thepointapp/src/views/page/splashPage.dart';

class RouteManager {
  static const String loadingPage = '/';
  static const String loginPage = '/loginPage';

  static Route<dynamic> onGenerationRoute(RouteSettings setting) {
    switch(setting.name) {
      case loadingPage:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case loginPage:
        return MaterialPageRoute(builder: (context) => LoginPage());
      default:
        throw Exception('No route found!');
    }
  }
}