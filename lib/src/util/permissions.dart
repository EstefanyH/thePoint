import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thepointapp/src/msic/widget/dialog.dart';
import 'package:thepointapp/src/util/constant.dart';

class Permissions {

   static Future<void> checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      print('Location permission is granted');
      isLocation = true;
    } else if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) { 

      await Permission.location.request().then((result) {
        if (result.isGranted) {
          print('Location permission granted');
          //return true;

          isLocation = true;
        } else {
           print('Location permission denied');
           //return false;
           isLocation = false;
        }
      });
    }
    //return false;
  } 
   
  static Future<bool> checkCameraPermission() async {
    final status = await Permission.camera.status;
    if (status.isGranted) {
      print('Location permission is granted');
      //isLocation = true;
      return true;
    } else if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) { 
      
      await Permission.camera.request().then((result) {
        if (result.isGranted) {
          print('Location permission granted');
          //return true;

          //isLocation = true;
          return true;
        } else {
           print('Location permission denied');
           //return false;
           //isLocation = false;
           return false;
        }
      });
    }
    return false;
  }
/*
  static Future<void> requestPermission(BuildContext context) async {
    print('hiii');
  }*/
}