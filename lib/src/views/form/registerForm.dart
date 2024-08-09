import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:thepointapp/src/msic/style.dart";
import "package:thepointapp/src/viewModel/registerViewModel.dart";

class RegisterForm extends RegisterViewModel { 
  late TextEditingController firstnameController;
  late TextEditingController lastnameController;
  late TextEditingController documentController;
  late TextEditingController mailController;

  @override
  void initState(){
    super.initState();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    documentController = TextEditingController();
    mailController = TextEditingController();
  }
  
  @override
  void dispose(){
    firstnameController.dispose();
    lastnameController.dispose();
    documentController.dispose();
    mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
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
                const Text('Crear cuenta', style: titleStyleIndigo,),
                const SizedBoxH20(),
                TextFormField(
                  //validator: validateName, 
                  controller: firstnameController,
                  maxLength: 15,
                  decoration: formDecoration("Nombre", Icons.person_outline),),
                const SizedBoxH10(),
                TextFormField(
                  //validator: validateName, 
                  controller: lastnameController,
                  maxLength: 15,
                  decoration: formDecoration("Apellidos", Icons.person_outline),),
                TextFormField(
                  //validator: validateName, 
                  controller: documentController,
                  maxLength: 20,
                  decoration: formDecoration("Nro. Documento", Icons.card_membership),),
                const SizedBoxH10(),
                 TextFormField(
                  //validator: validateEmail, 
                  controller: mailController,
                  maxLength: 30,
                  decoration: formDecoration("Email address", Icons.mail_outline),),
                const SizedBoxH30(),
                CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text( 'Tomar foto', 
                    style: style16Indigo,),
                  ],), 
                  onPressed: () {
                    //gotoVerifyView(phoneController.text.toString());
                  }
                ),
                const SizedBoxH10(),
                CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.indigo,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text( 'Guardar', 
                    style: style16White,),
                  ],), 
                  onPressed: () {
                    //gotoVerifyView(phoneController.text.toString());
                  }
                ),
              ],)
            ),
      ),
    );
  }
}
 