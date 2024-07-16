
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:sprintf/sprintf.dart';
import 'package:thepointapp/src/models/request/coordenadaRequest.dart';
import 'package:thepointapp/src/models/response/coordenadaResponse.dart';
import 'package:thepointapp/src/network/iNetwork/iMapService.dart';
import 'package:http/http.dart' as http;
import 'package:thepointapp/src/util/apiService.dart';

class MapService extends IMapService with ChangeNotifier {
  
  @override
  Future<dynamic> searchAdress(String ruta, String token) async {
    
    try {
      String request = sprintf(API_GOOGLE_PLACE,[ruta, token]);
      var response = await http.get(Uri.parse(request));

      var data = json.decode(response.body);
       
      if (kDebugMode) {
        print('request-> ${request}');
        print(data);
      }
      if (response.statusCode == 200) {
        return json.decode(response.body)['predictions'];
      } else {}
      throw Exception('Failed');
    }catch (er) {
      print('error searchAdress -> ${er.toString()}');
    }
    return null;
  }

  @override
  Future<dynamic> getLocation(String address) async {
    // TODO: implement getLocation
    try {
      String request = sprintf(API_GOOGLE_GEOCODING,[address.replaceAll(' ', '+')]);
      var response = await http.get(Uri.parse(request));

      var data = json.decode(response.body);
       
      if (kDebugMode) {
        print('request-> ${request}');
        print(data);
      }
      
      if (response.statusCode == 200) {
        var result = CoordenadaResponse.fromJson(json.decode(response.body)['results'][0]['geometry']['location']); 
        var enti = CoordenadaRequest();
        enti.lat = result.lat;
        enti.lng = result.lng; 
        print('coordenada -> latitud: ${result.lat} , longitud: ${result.lng}');

        return enti; 
      } else {}
      throw Exception('Failed');
    } catch(er) {
      print('error getLocation -> ${er.toString()}');
    }
    return null;
  }

  
}