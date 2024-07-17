
import 'package:flutter/material.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/views/page/profilePage.dart';

class ProfileViewModel extends State<ProfilePage> {

  void goToSession() {
    Navigator.popAndPushNamed(context, RouteManager.sessionPage);
  }

  void toggleSwitch(bool value) {  
    
  }  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}