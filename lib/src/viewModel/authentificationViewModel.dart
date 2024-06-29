import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thepointapp/src/network/sessionService.dart';
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
  
  void authentification()  async {
    try{
      var data = await sessionManager.authWithGoogle();
      print('validar');
    } catch(error) {
      print('Error en la authentification: $error');
    }
  }
}