import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 
import 'package:thepointapp/src/msic/style.dart';
import 'package:thepointapp/src/util/permissions.dart';
import 'package:thepointapp/src/viewModel/authentificationViewModel.dart';

class SessionForm extends AuthentificationViewModel { 
  
  @override
  void initState()  {
    super.initState();  
    try {
      setState(() {
        Permissions.checkLocationPermission();
      });
    }catch (er){
      print(er.toString());
    }
  }

  @override
  void dispose() { 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/illustration-1.png',
                      height: 540,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Text('Inicio sesión con:',
                  style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20.0, 
                          color: Colors.black38,
                          fontWeight: FontWeight.bold)),
                  const SizedBoxH20(),
                  CupertinoButton(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.indigo,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text( 'Entrar con número de celular', 
                        style: style16White,),
                      ],), 
                      onPressed: () {   
                        signInPhone();
                      }
                    ),
                  const SizedBoxH10(),
                ],
              ),
            ),
            ]
          )
        ),
    );
  }
}