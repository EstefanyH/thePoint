import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thepointapp/src/msic/style.dart';
import 'package:thepointapp/src/viewModel/phoneViewModel.dart';

class PhoneForm extends PhoneViewModel {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.white, 
      body: SafeArea(
        child:  Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Ingrese número de telefono', style: titleStyleIndigo,),
                const SizedBoxH10(),
                const Text('Por favor introduce tu número de móvil válido para recibir el código'),
                const SizedBoxH20(),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(),
                      ),
                ),
                const SizedBoxH30(),
                CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.indigo,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text( 'Ingresar', 
                    style: style16White,),
                  ],), 
                  onPressed: () {
                    gotoVerifyView();
                  }
                ),
              ],)
            ),
      ),
    );
  }
}