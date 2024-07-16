import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thepointapp/src/msic/style.dart';
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
            const Text('Buscando....', style: style16Indigo,),
            SizedBoxH10(),
            const Text('Se esta asignando chofer', style: style16Indigo,),
            SizedBoxH10(),
            CupertinoButton(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.indigo,
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