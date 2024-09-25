
import 'package:flutter/material.dart';
import 'package:thepointapp/src/views/page/loginPage.dart';
import 'package:thepointapp/src/views/page/lookingPage.dart';
import 'package:thepointapp/src/views/page/mainPage.dart';
import 'package:thepointapp/src/views/page/mapPage.dart';
import 'package:thepointapp/src/views/page/phonePage.dart';
import 'package:thepointapp/src/views/page/racePage.dart';
import 'package:thepointapp/src/views/page/otpPage.dart';
import 'package:thepointapp/src/views/page/registerPage.dart';
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
  static const String lookingPage = '/LookingPage';
  static const String registerPage = '/RegisterPage';

  static Route<dynamic> onGenerationRoute(RouteSettings setting) {
    switch(setting.name) {
      case loadingPage:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case sessionPage:
        return MaterialPageRoute(builder: (context) => const SessionPage());
      case phonePage:
        return MaterialPageRoute(builder: (context) => const PhonePage());
      case otpPage:
        return MaterialPageRoute(builder: (context) => const OtpPage());
      case racePage:
        return MaterialPageRoute(builder: (context) => const RacePage());
      case mapPage:
        return MaterialPageRoute(builder: (context) => const MapPage());
      case mainPage:
        return MaterialPageRoute(builder: (context) => const MainPage());
      case lookingPage:
        return MaterialPageRoute(builder: (context) => const LookingPage());
      case registerPage:
        return MaterialPageRoute(builder: (context) => RegisterPage());
      default:
        throw Exception('No route found!');
    }
  }
}