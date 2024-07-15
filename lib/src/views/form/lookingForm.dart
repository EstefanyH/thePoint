import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thepointapp/src/viewModel/lookingViewModel.dart';

class LookingForm extends LookingViewModel {
  
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
      body: currentP == null ? 
        const Center(child: Text('Loading'),) 
        : GoogleMap( onMapCreated: ((GoogleMapController controller) => 
          mapController.complete(controller)),
        initialCameraPosition: CameraPosition(
          target: pGooglePlex, zoom: 15),
          markers: {
            Marker(
              markerId: MarkerId("_currentLocation"), 
              icon: BitmapDescriptor.defaultMarker, 
              position: currentP!),
            Marker(
              markerId: MarkerId("_sourceLocation"), 
              icon: BitmapDescriptor.defaultMarker, 
              position: pGooglePlex),
            Marker(
              markerId: MarkerId("_destinationLocation"), 
              icon: BitmapDescriptor.defaultMarker, 
              position: pApplePark)
          },
          polylines: Set<Polyline>.of(polylines.values),
      )
    );
  }





}