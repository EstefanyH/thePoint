import 'package:flutter/material.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/views/page/registerPage.dart';

class RegisterViewModel extends State<RegisterPage> {
  
  @override
  void initState(){
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
    void closeView() {
    Navigator.popAndPushNamed(context, RouteManager.sessionPage);
  }
  
}