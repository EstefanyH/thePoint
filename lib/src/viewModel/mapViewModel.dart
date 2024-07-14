
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/util/constant.dart';
import 'package:thepointapp/src/views/page/mapPage.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class MapViewModel extends State<MapPage> {
  final String token = '123456789';

  var uuid = const Uuid();
  List<dynamic> listOfLocation = [];

  void goBackRaceView() {
    Navigator.popAndPushNamed(context, RouteManager.mainPage);
  }
  
  void placeSuggestion(String input) async {
    try {
      String baseUrl = "https://maps.googleapis.com/maps/api/place/autocomplete/json";
      String request = '$baseUrl?input=$input&key=$GOOGLE_MAP_API_KEY&sessiontoken=$token';
      var response = await http.get(Uri.parse(request));

      var data = json.decode(response.body);
       
      if (kDebugMode) {
        print('request-> ${request}');
        print(data);
      }
      if (response.statusCode == 200) {
        setState(() {
          listOfLocation = json.decode(response.body)['predictions'];
        });
      } else {}
      throw Exception('Failed');
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