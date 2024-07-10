
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:telephony/telephony.dart';
import 'package:thepointapp/src/msic/widget/dialog.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/util/constant.dart';
import 'package:thepointapp/src/views/page/phonePage.dart';

class PhoneViewModel extends State<PhonePage> {
  String code = "";
  final Telephony telephony = Telephony.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
  void generateCode() {
    final random = Random();
    final generatedCode = random.nextInt(10000).toString().padLeft(4, '0');
    setState(() {
      code = generatedCode;
      print('Generate code: ${code}');
      telephony.sendSms(to: "777", message: "Codigo de verificacion ${code}");
      
    });
  }

  void gotoVerifyView(String numberPhone) async {
    if (numberPhone == '' ||  numberPhone.length < 9) {
      showSnackBar(context, "Ingrese numero celular", 300);
    } else {
      gb_phone = numberPhone; 
      generateCode();
      Navigator.popAndPushNamed(context, RouteManager.otpPage);
    }
  }
   
}