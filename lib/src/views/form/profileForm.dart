
import 'package:flutter/material.dart';
import 'package:thepointapp/src/viewModel/profileViewModel.dart';

class ProfileForm extends ProfileViewModel {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Cuenta'),),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            InkWell(
              child: Text('Cerrar Sesión'), 
              onTap: () { goToSession (); },)
          ],
        ),
      ),
    );
  }
  
}