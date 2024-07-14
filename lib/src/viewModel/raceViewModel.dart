import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/views/page/racePage.dart';

class RaceViewModel extends State<RacePage> {
  GoogleMapController? mapController;
  //final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  
  LocationData? currentLocation;

  final Location location = Location();

    /*
  CameraPosition point = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
      */
  //final LatLng point = const LatLng(45.521563, -122.677433);
  
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
    print('tap');
    Navigator.popAndPushNamed(context, RouteManager.mapPage);
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
    Navigator.popAndPushNamed(context, RouteManager.lookingPage);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}