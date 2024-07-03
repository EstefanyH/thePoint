import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thepointapp/src/network/sessionService.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/views/page/sessionPage.dart';

class AuthentificationViewModel extends State<SessionPage> {
  SessionService get sessionManager =>  context.read<SessionService>();  

  @override
  void initState(){
    super.initState();
    
  }
  

  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  void signInWithGoogle () async {
    try {
      /*var result = await sessionManager.authWithGoogle();      
      if (result!.user?.displayName != null)
      {
        Navigator.popAndPushNamed(context, RouteManager.loginPage);
      }*/
    } catch(e) {
      print(e.toString());
    }
  }

  void signInPhone() {
    Navigator.popAndPushNamed(context, RouteManager.phonePage);
  }
 
}