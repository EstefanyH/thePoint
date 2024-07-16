import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thepointapp/src/viewModel/lookingViewModel.dart';
import 'package:thepointapp/src/views/modal/modalSearchDriver.dart';

class LookingForm extends LookingViewModel {
  
  @override
  void initState() {
    super.initState();
    getLocationUpdates().then((_) => {
      getPolylinePoint().then((coordinates) => {
        generatePolylineFromPoint(coordinates)
      })
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showModalBottomSheet( 
        isDismissible: false, enableDrag: false,
        context: context, 
        builder: ( context) => const ModalSearchDriver());
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.white,
      body: currentP == null ? 
        const Center(child: Text('Loading'),) 
        : 
        GoogleMap( 
          onMapCreated: ((GoogleMapController controller) => 
            mapController.complete(controller)),
          initialCameraPosition: CameraPosition(
          target: pGooglePlex, zoom: 15),
          markers: {
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
      ), 
  
    );
  }





}