
import 'package:flutter/cupertino.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/views/page/lookingPage.dart';

class LookingViewModel extends State<LookingPage> {

  void goBackRaceView() {
    Navigator.popAndPushNamed(context, RouteManager.mainPage);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}