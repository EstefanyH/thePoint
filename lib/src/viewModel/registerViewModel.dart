import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:thepointapp/src/msic/widget/dialog.dart';
import 'package:thepointapp/src/network/registerService.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/util/constant.dart';
import 'package:thepointapp/src/util/permissions.dart';
import 'package:thepointapp/src/views/page/registerPage.dart';

class RegisterViewModel extends State<RegisterPage> {
  
  late bool isAccountActive;
  late bool isPhotoActive;
  late bool isCarActive;
  late bool isCardActive;

  final double? sizeIcon = 25;
  final double? sizeIconBackground = 40;

  late File? rutaPhoto;

  RegisterService get service =>  context.read<RegisterService>();

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

  void save() {
    setState(() {  
      isAccountActive = false;
      isPhotoActive = true;
    });
  }
  
  void openCamera() async {
    setState(() {
      Permissions.checkCameraPermission();
      _pickImage(ImageSource.camera, context);
    });
  }

  void openGallery () async {
    setState(()  {
      Permissions.checkCameraPermission();
      _pickImage(ImageSource.gallery, context);
    });

  }

  void _pickImage(ImageSource source, BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      // Do something with the selected image (e.g., display it, upload it)
      print('Picked image: ${image.path}');
      setState(() {
        rutaPhoto = File(image.path);
      });
      //sendMessage(texto: image.path, type: TypeMessage.img);
    }
    Navigator.pop(context);
  }

  void saveFile(String filePath) {
    if (filePath.isNotEmpty) {
      service.postFile(filePath);
    } else {
      showSnackBar(context, 'Seleccionar foto de perfil', gb_duration_showSnackBar);
    }
  }

}