import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telephony/telephony.dart';
import 'package:thepointapp/src/msic/style.dart';
import 'package:thepointapp/src/viewModel/phoneViewModel.dart';

class PhoneForm extends PhoneViewModel {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white, 
      body: SafeArea(
        child:  Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      closeView();
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.indigo,
                      size: 32,),),
                ),
                const SizedBoxH30(),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle),
                  child: Image.asset(
                    'assets/images/illustration-2.png',
                    height: 250,
                  ),),
                const SizedBoxH30(),
                const Text('Ingrese número de telefono', style: titleStyleIndigo,),
                const SizedBoxH10(),
                const Text('Por favor introduce tu número de móvil válido para recibir el código'),
                const SizedBoxH20(),
                TextFormField(
                  controller: phoneController,
                  textInputAction: TextInputAction.done,
                  inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(9), // Limitar a 9 dígitos
                    ],
                  maxLength: 9,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(),
                      ),
                ),
                const SizedBoxH30(),
                CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.indigo,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text( 'Ingresar', 
                    style: style16White,),
                  ],), 
                  onPressed: () {
                    gotoVerifyView(phoneController.text.toString());
                  }
                ),
              ],)
            ),
      ),
    );
  }

}