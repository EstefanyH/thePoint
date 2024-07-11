
import 'package:flutter/material.dart';
import 'package:thepointapp/src/msic/style.dart';
import 'package:thepointapp/src/util/constant.dart';
import 'package:thepointapp/src/viewModel/profileViewModel.dart';

class ProfileForm extends ProfileViewModel {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBoxH30(),
            Row(
              children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle),
                    child: Image.asset(
                      'assets/images/illustration-2.png',
                      height: 70,
                    ),
                  ),
                ),),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Nombre de ingresante', 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black54),),
                    Text(gb_phone, 
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black54),),
                  ],)),
            ],),
            const SizedBoxH20(),
            
            Visibility(
              child: Container(
                margin: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded( 
                      flex: 1, 
                      child: InkWell(
                        child: const Text('Mis Datos'), 
                        onTap: () { goToSession (); },),),
                    Expanded( 
                      flex: 1, 
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                        child: const Icon(
                          Icons.arrow_right, 
                          color: Colors.deepPurple,), 
                        onTap: () { goToSession (); },),),),
                  ],
                ),
              )
            ),
            const Separator(),
            Visibility(
              child: Container(
                margin: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded( 
                      flex: 1, 
                      child: InkWell(
                        child: const Text('Forma de Pago'), 
                        onTap: () { goToSession (); },),),
                    Expanded( 
                      flex: 1, 
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                        child: const Icon(
                          Icons.arrow_right, 
                          color: Colors.deepPurple,), 
                        onTap: () { goToSession (); },),),),
                  ],
                ),
              )
            ),
            const Separator(),
            Visibility(
              child: Container(
                margin: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded( 
                      flex: 1, 
                      child: InkWell(
                        child: const Text('Mis Viajes'), 
                        onTap: () { goToSession (); },),),
                    Expanded( 
                      flex: 1, 
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                        child: const Icon(
                          Icons.arrow_right, 
                          color: Colors.deepPurple,), 
                        onTap: () { goToSession (); },),),),
                  ],
                ),
              )
            ),
            const Separator(),
            Visibility(
              child: Container(
                margin: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: const Text('Cerrar Sesión'), 
                      onTap: () { goToSession (); },),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
  
}