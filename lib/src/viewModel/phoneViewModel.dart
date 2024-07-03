
import 'package:flutter/widgets.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/views/page/phonePage.dart';

class PhoneViewModel extends State<PhonePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
  void gotoVerifyView() {
    Navigator.popAndPushNamed(context, RouteManager.sendPage);
  }
}