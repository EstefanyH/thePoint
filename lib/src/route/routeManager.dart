
import 'package:flutter/material.dart';
import 'package:thepointapp/src/views/page/loginPage.dart';
import 'package:thepointapp/src/views/page/mainPage.dart';
import 'package:thepointapp/src/views/page/mapPage.dart';
import 'package:thepointapp/src/views/page/phonePage.dart';
import 'package:thepointapp/src/views/page/racePage.dart';
import 'package:thepointapp/src/views/page/otpPage.dart';
import 'package:thepointapp/src/views/page/sessionPage.dart';
import 'package:thepointapp/src/views/page/splashPage.dart';

class RouteManager {
  static const String loadingPage = '/';
  static const String loginPage = '/loginPage';
  static const String sessionPage = '/sessionPage';
  static const String phonePage = '/phonePage';
  static const String otpPage = '/otpPage';
  static const String racePage = '/racePage';
  static const String mapPage = '/mapPage';
  static const String mainPage = '/MainPage';

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
      case otpPage:
        return MaterialPageRoute(builder: (context) => OtpPage());
      case racePage:
        return MaterialPageRoute(builder: (context) => RacePage());
      case mapPage:
        return MaterialPageRoute(builder: (context) => MapPage());
      case mainPage:
        return MaterialPageRoute(builder: (context) => MainPage());
      default:
        throw Exception('No route found!');
    }
  }
}