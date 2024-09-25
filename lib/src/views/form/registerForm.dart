import "dart:io";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:provider/provider.dart";
import "package:thepointapp/src/msic/style.dart";
import "package:thepointapp/src/network/registerService.dart";
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

    isAccountActive = true;
    isPhotoActive = false;
    isCarActive = false;
    isCardActive = false;
    rutaPhoto = null;
  }
  
  @override
  void dispose(){
    firstnameController.dispose();
    lastnameController.dispose();
    documentController.dispose();
    mailController.dispose();
    rutaPhoto = null;
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
                const SizedBoxH20(),
                Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: sizeIconBackground,
                        height: sizeIconBackground,
                        decoration: BoxDecoration(
                          color: isAccountActive ? Colors.orange.shade100 : Colors.grey.shade100,
                          shape: BoxShape.circle),
                        child: Icon(Icons.person, 
                          color: isAccountActive ? Colors.orange : Colors.grey,
                          size: sizeIcon,
                        ),
                      ),
                    ),),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: sizeIconBackground,
                        height: sizeIconBackground,
                        decoration: BoxDecoration(
                          color: isPhotoActive ? Colors.orange.shade100 : Colors.grey.shade100,
                          shape: BoxShape.circle),
                        child: Icon(Icons.photo_camera_sharp, color: isPhotoActive ? Colors.orange : Colors.grey,
                          size: sizeIcon,
                        ),
                      ),
                    ),),
                    Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: sizeIconBackground,
                        height: sizeIconBackground,
                        decoration: BoxDecoration(
                          color: isCarActive ? Colors.orange.shade100 : Colors.grey.shade100,
                          shape: BoxShape.circle),
                        child: Icon(Icons.car_rental,color: isCarActive ? Colors.orange : Colors.grey,
                          size: sizeIcon,
                        ),
                      ),
                    ),),
                    Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: sizeIconBackground,
                        height: sizeIconBackground,
                        decoration: BoxDecoration(
                          color: isCardActive ? Colors.orange.shade100 : Colors.grey.shade100,
                          shape: BoxShape.circle),
                        child: Icon(Icons.credit_card,color: isCardActive ? Colors.orange : Colors.grey,
                          size: sizeIcon,
                        ),
                      ),
                    ),),
                ],),
                const SizedBoxH30(),
                Visibility(
                  //visible: false,
                  visible: isAccountActive ? true : false,
                  child: Column(
                    children: [
                    const Text('Usuario', style: titleStyleIndigo,),
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
                      color: Colors.indigo,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text( 'Siguiente', 
                        style: style16White,),
                      ],), 
                      onPressed: () {
                        save();
                      }
                    ),
                    ],
                  )),
                Visibility(
                  visible: isPhotoActive ? true : false,
                  child: Column(
                    children: [
                      const Text('Tomar foto', style: titleStyleIndigo,),
                      const SizedBoxH20(),
                      Container(
                        width: 280,
                        height: 280,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade50,
                          shape: BoxShape.circle),
                        child: rutaPhoto != null ?
                            ClipOval(
                              child: Image.file(rutaPhoto!, width: 250, height: 250, fit: BoxFit.cover,),
                            ) : Image.asset('assets/images/illustration-2.png', height: 250,) 
                      ),
                      const SizedBoxH20(),
                      CupertinoButton(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text( 'Elegir foto', 
                          style: style16Indigo,),
                        ],), 
                        onPressed: () {
                          showModalBottomSheet(
                            context: context, 
                            builder: (context) {
                              return Container(
                                height: 80,
                                color: Colors.white,
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  //padding: const EdgeInsets.all(40.0),
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        child: const Column(
                                          children: [
                                            Icon(Icons.camera, size: 30,),
                                            Text('Camara')
                                          ],),
                                        onTap: () async {
                                          openCamera();
                                        },
                                      )
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        child: const Column(
                                          children: [
                                            Icon(Icons.photo_album, size: 30,),
                                            Text('Galeria')
                                          ],),
                                          onTap: () async {
                                            openGallery();
                                          },
                                      )
                                    ),
                                  ],
                                ),
                              );
                            }
                          );
                        }
                      ),
                      const SizedBoxH50(),                
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
                          saveFile(rutaPhoto != null ? rutaPhoto!.path : '');
                        }
                      ),
                    ],)),
                
              ],)
            ),
      ),
    );
  }

  void _pickImage(ImageSource source, BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      // Do something with the selected image (e.g., display it, upload it)
      print('Picked image: ${image.path}');

      //sendMessage(texto: image.path, type: TypeMessage.img);
    }
    Navigator.pop(context);
  }
}
 