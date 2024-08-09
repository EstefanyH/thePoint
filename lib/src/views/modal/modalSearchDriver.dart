import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thepointapp/src/msic/style.dart';
import 'package:thepointapp/src/msic/widget/appProgressIndicator.dart';
import 'package:thepointapp/src/route/routeManager.dart';

class ModalSearchDriver extends StatefulWidget {
  const ModalSearchDriver({super.key});

  @override
  State<ModalSearchDriver> createState() => _ModalSearchDriverState();
}

class _ModalSearchDriverState extends State<ModalSearchDriver> {
  
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10.0), 
        child: Column(
          children: [
            Icon(Icons.keyboard_double_arrow_up, 
            color: Colors.orange.shade800,
            size: 30,),
            SizedBoxH10(),
            const Text('Buscando....', 
                style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16.0, 
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),),
            AppProgressIndicator(),
            const Text('Se esta asignando chofer', 
                style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16.0, 
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),),
            SizedBoxH10(),
            CupertinoButton(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.orange.shade800,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text( 'Cancelar viaje', 
                  style: style16White,),
              ],), 
              onPressed: () {  
                Navigator.popAndPushNamed(context, RouteManager.mainPage);
              }
            ),
          ],),)
      );
  }
}