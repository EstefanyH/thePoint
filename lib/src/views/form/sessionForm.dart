import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thepointapp/src/msic/style.dart';
import 'package:thepointapp/src/viewModel/authentificationViewModel.dart';

class SessionForm extends AuthentificationViewModel { 
  @override
  void initState() {
    super.initState(); 
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
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue,
                      child: Center(child: Text('Top Left', style: TextStyle(color: Colors.white))),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const SizedBoxH50(),
                  const Text('Inicio sesión con:',
                  style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20.0, 
                          color: Colors.indigo,
                          fontWeight: FontWeight.w300)),
                  const SizedBoxH20(),
                  CupertinoButton(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                  CupertinoButton(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.indigo,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text( 'Google', 
                        style: style16White,),
                      ],), 
                      onPressed: () {   
                        signInWithGoogle();
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