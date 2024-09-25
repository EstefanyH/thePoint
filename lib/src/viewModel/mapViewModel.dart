import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:thepointapp/src/network/mapService.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/util/constant.dart';
import 'package:thepointapp/src/views/page/mapPage.dart';
import 'package:uuid/uuid.dart';

class MapViewModel extends State<MapPage> {

  MapService get service =>  context.read<MapService>();

  final String token = '123456789';

  var uuid = const Uuid();
  List<dynamic> listOfLocation = [];

  void goBackRaceView() {
    Navigator.popAndPushNamed( context, RouteManager.mainPage);
  }

  void goSelectionLocation(String ruta, String place) async {
    print('Selection Location -> $ruta');
    
    var result = await service.getLocation(place);

    if (gb_isOrigin) {
      race.origin = ruta;
      race.originLocation = result;
    } else {
      race.destination = ruta;
      race.destinationLocation = result;
    }
    Navigator.popAndPushNamed(context, RouteManager.mainPage);
  }
  
  void placeSuggestion(String input) async {
    try {
      var result = await service.searchAdress(input, token);

      setState(() {
          listOfLocation = result as List;
      });
    } catch(er) {
      print(er.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}