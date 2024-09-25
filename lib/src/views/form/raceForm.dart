import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thepointapp/src/models/request/raceRequest.dart';
import 'package:thepointapp/src/msic/style.dart';
import 'package:thepointapp/src/util/constant.dart';
import 'package:thepointapp/src/util/permissions.dart';
import 'package:thepointapp/src/viewModel/raceViewModel.dart';

class RaceForm extends RaceViewModel {

  @override
  void initState() {
    super.initState();
    setState(() {
        Permissions.checkLocationPermission();
        if (isLocation){
          getCurrentLocation();
        }
        loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(    
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GoogleMap(
                      mapType: MapType.terrain,
                      onMapCreated: onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: currentLocation == null ? const LatLng (0,0) : 
                                LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                        zoom: 11.0,
                      ),
                       myLocationEnabled: true,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(15), 
                child: Column(
                  children: [
                    const Text('Te llevo ah..', style: titleStyleIndigo,),
                    InkWell(
                      child: TextFormField(
                          controller: originController,
                          enabled: false,
                          decoration: const InputDecoration(
                            counterText: '',
                            labelText: 'Origen',
                            prefixIcon: Icon(Icons.gps_fixed, color: Colors.blueAccent,),
                            border: OutlineInputBorder(),
                          ),
                          readOnly: true
                        ),
                      onTap: () {
                        gb_isOrigin = true;
                        goToMapView(); 
                      },
                    ),
                    const SizedBoxH10(),
                    InkWell(
                      child: TextFormField(
                        controller: destinationController,
                        enabled: false,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          counterText: '',
                          labelText: 'Llegada',
                          prefixIcon: Icon(Icons.map, color: Colors.blueAccent,),
                          border: OutlineInputBorder(),
                        )
                      ),
                      onTap: () {
                        gb_isOrigin = false;
                      goToMapView(); 
                      },),                            
                    const SizedBoxH10(),
                    TextFormField(
                      controller: montoController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        counterText: '',
                        labelText: 'Monto',
                        prefixIcon: Icon(Icons.payment, color: Colors.blueAccent,),
                        border: OutlineInputBorder(),
                      )
                    ),
                    const SizedBoxH10(),
                    CupertinoButton(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.indigo,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text( 'Taxi...', 
                        style: style16White,),
                      ],), 
                      onPressed: () {  
                        goToLookingView();
                      }
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}