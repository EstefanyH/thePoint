import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:thepointapp/src/util/constant.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:thepointapp/src/viewModel/lookingViewModel.dart';

class LookingForm extends LookingViewModel {
  Location _locationController = new Location();
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();

  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  static const LatLng _pApplePark = LatLng(37.3346, -122.0090);
  LatLng? _currentP = null;

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then((_) => {
      getPolylinePoint().then((coordinates) => {
        generatePolylineFromPoint(coordinates)
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
         leading: IconButton(
          onPressed: () { 
            goBackRaceView();
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp,
          color: Colors.indigo,), ),
        ),
      backgroundColor: Colors.white,
      body: _currentP == null ? 
        const Center(child: Text('Loading'),) 
        : GoogleMap( onMapCreated: ((GoogleMapController controller) => 
          _mapController.complete(controller)),
        initialCameraPosition: CameraPosition(
          target: _pGooglePlex, zoom: 15),
          markers: {
            Marker(
              markerId: MarkerId("_currentLocation"), 
              icon: BitmapDescriptor.defaultMarker, 
              position: _currentP!),
            const Marker(
              markerId: MarkerId("_sourceLocation"), 
              icon: BitmapDescriptor.defaultMarker, 
              position: _pGooglePlex),
            const Marker(
              markerId: MarkerId("_destinationLocation"), 
              icon: BitmapDescriptor.defaultMarker, 
              position: _pApplePark)
          },
          polylines: Set<Polyline>.of(polylines.values),
      )
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: pos, zoom: 13);
      await controller.animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    //Permissions.checkLocationPermission();

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if(_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted == PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if(currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });
        _cameraToPosition(_currentP!);
      }
    });
  }

  Future<List<LatLng>> getPolylinePoint() async {
    List<LatLng> polylineCoordinate = [];
    PolylinePoints polylinePoints = PolylinePoints();
    
    PolylineRequest polylineRequest = new PolylineRequest(
      origin: PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude), 
      destination: PointLatLng(_pApplePark.latitude, _pApplePark.longitude), 
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

}