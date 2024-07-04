
import 'package:flutter/widgets.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/views/page/mapPage.dart';

class MapViewModel extends State<MapPage> {

  void goBackRaceView() {
    Navigator.popAndPushNamed(context, RouteManager.racePage);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}