import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thepointapp/src/models/request/raceRequest.dart';
import 'package:thepointapp/src/msic/widget/dialog.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/util/constant.dart';
import 'package:thepointapp/src/views/page/racePage.dart';

class RaceViewModel extends State<RacePage> {
  GoogleMapController? mapController; 
  
  LocationData? currentLocation;

  final TextEditingController montoController = TextEditingController();
  final TextEditingController originController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  final Location location = Location();
  late RaceRequest data;
  
  Future<void> requestPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
    if (await Permission.location.isGranted) {
      getCurrentLocation();
    } else {
      // Handle permission denied
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location permission denied')),
      );
    }
  }
  
  void onMapCreated(GoogleMapController controller) {
    //mapController.complete(controller);
    mapController = controller;
    getCurrentLocation();
  }

  void goToMapView() {
    Navigator.pushNamed(context, RouteManager.mapPage);
  }

  void getCurrentLocation() async {
    try {
      final LocationData locationResult = await location.getLocation();
      setState(() {
        currentLocation = locationResult;
      });

      if (mapController != null) {
        mapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
              zoom: 14.0,
            ),
          ),
        );
      }
    } catch(ex){
      print(ex.toString());
    }
  }

  void goToLookingView() async {
    if (validateData()) {
      Navigator.popAndPushNamed(context, RouteManager.lookingPage);
    }
  }
  
  void loadData() {
    data = race;
    originController.text = data.origin.isEmpty ?  '' : data.origin;
    destinationController.text = data.destination.isEmpty ?  '' : data.destination;
    montoController.text = data.precio.toString();
  }

  void loadClear(){
    originController.clear();
    originController.clear();
    destinationController.clear();
  }
  
  bool validateData() {
    if(originController.text.isEmpty){
      showSnackBar(context, 'Ingrese punto de partida', gb_duration_showSnackBar);
      return false;
    }
    if(destinationController.text.isEmpty){
      showSnackBar(context, 'Ingrese punto de llegada', gb_duration_showSnackBar);
      return false;
    }
    if(montoController.text.isEmpty && montoController.text.trim().toString() == '0.00' 
      && montoController.text.trim().toString() == '0.0' && montoController.text.trim().toString() == '0'){
      showSnackBar(context, 'Ingrese precio de servicio', gb_duration_showSnackBar);
      return false;
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}