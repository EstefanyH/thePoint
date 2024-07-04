
import 'package:flutter/material.dart';
import 'package:thepointapp/src/msic/style.dart';
import 'package:thepointapp/src/viewModel/mapViewModel.dart';

class MapForm extends MapViewModel {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0, 
        title: const Text("Ubicación"),
        leading: IconButton(
          onPressed: () { 
            goBackRaceView();
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp,
          color: Colors.indigo,), ),
        backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                counterText: '',
                labelText: 'Ingresa ubicación',
                border: OutlineInputBorder(),
              ),
              onTap: () { }
            ),
            const SizedBoxH20(),
            Text('Precisar en mapa'),
          ],),),
    );
  }
}