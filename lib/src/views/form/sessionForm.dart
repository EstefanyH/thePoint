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

    return Container(
      height: 130,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset(9, 9),
            blurRadius: 6,
          ),
        ],
      ),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
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
            onPressed: () {  },
            child: const Text( 'Entrar con número de celular',  style: style16White,),),
          const SizedBoxH10(),
          CupertinoButton(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.indigo,
            onPressed: () {  },
            child: const Text( 'Google',  style: style16White,),),
          const SizedBoxH10(),
          ]
        )
    );
  }
}