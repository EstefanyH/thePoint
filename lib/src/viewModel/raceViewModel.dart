import 'package:flutter/material.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/views/page/racePage.dart';

class RaceViewModel extends State<RacePage> {

  void goToMapView() {
    print('tap');
    Navigator.popAndPushNamed(context, RouteManager.mapPage);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}