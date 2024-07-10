import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thepointapp/src/msic/widget/dialog.dart';
import 'package:thepointapp/src/util/constant.dart';

class Permissions {

   static Future<void> checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      print('Location permission is granted');
      //return true;
      isLocation = true;
      //return true;
    } else if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) {
      // Location permission is denied, request permission
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
   

  static Future<void> requestPermission(BuildContext context) async {
    print('hiii');
  }
}