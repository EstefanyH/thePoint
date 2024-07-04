
import 'package:flutter/widgets.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/views/page/sendPage.dart';

class SendViewModel extends State<SendPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
  void goBackPhoneView() {
    Navigator.popAndPushNamed(context, RouteManager.phonePage);
  }

  void goToRaceView() {
    Navigator.popAndPushNamed(context, RouteManager.mainPage);
  }
}