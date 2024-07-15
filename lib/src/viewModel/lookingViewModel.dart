
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/util/constant.dart';
import 'package:thepointapp/src/views/page/lookingPage.dart';

class LookingViewModel extends State<LookingPage> {

  Location locationController = new Location();
  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();

  LatLng pGooglePlex = LatLng(37.4223, -122.0848);
  LatLng pApplePark = LatLng(37.3346, -122.0090);
  LatLng? currentP = null;

  Map<PolylineId, Polyline> polylines = {};

  void goBackRaceView() {
    Navigator.popAndPushNamed(context, RouteManager.mainPage);
  }

  Future<void> cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: pos, zoom: 13);
      await controller.animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus permissionGranted;
    //Permissions.checkLocationPermission();

    _serviceEnabled = await locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await locationController.hasPermission();
    if(permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted == PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged.listen((LocationData currentLocation) {
      if(currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });
        cameraToPosition(currentP!);
      }
    });
  }

  Future<List<LatLng>> getPolylinePoint() async {
    List<LatLng> polylineCoordinate = [];
    PolylinePoints polylinePoints = PolylinePoints();
    
    PolylineRequest polylineRequest = new PolylineRequest(
      origin: PointLatLng(pGooglePlex.latitude, pGooglePlex.longitude), 
      destination: PointLatLng(pApplePark.latitude, pApplePark.longitude), 
      mode: TravelMode.driving);
    

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      request: polylineRequest, googleApiKey: GOOGLE_MAP_API_KEY
    );

    if (result.points.isEmpty){
      result.points.forEach((PointLatLng point) {
        polylineCoordinate.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinate;
  }

  void generatePolylineFromPoint(List<LatLng> polylineCoordinate) async { 
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id, 
      color: Colors.black, 
      points: polylineCoordinate, 
      width: 8);
      setState(() {
        polylines[id] = polyline;
      });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}