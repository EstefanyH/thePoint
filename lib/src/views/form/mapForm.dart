
import 'package:flutter/material.dart';
import 'package:thepointapp/src/msic/style.dart';
import 'package:thepointapp/src/viewModel/mapViewModel.dart';

class MapForm extends MapViewModel {
  
  final searchController = TextEditingController();

  @override
  void initState() {
    searchController.addListener((){
      _onchange();
    });
    super.initState();
  }
  _onchange(){
    placeSuggestion(searchController.text);
  }

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
              controller: searchController,
              decoration: const InputDecoration(
                counterText: '',
                labelText: 'Ingresa ubicación',
                prefixIcon: Icon(Icons.gps_fixed, color: Colors.blueAccent,),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                                   
                });
               },
            ),
            const SizedBoxH20(),
            Text('Precisar en mapa'),
            Visibility(
              visible: searchController.text.isEmpty ? false : true,
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listOfLocation.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () { },
                      child: Text(listOfLocation[index]['description']),
                    );
                  },
                )
              ),
            ),
            Visibility(
              visible: searchController.text.isEmpty ? true : false,
              child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center  ,
                  children: [
                    Icon(Icons.my_location, color: Colors.green,),
                    SizedBoxH10(),
                    Text("Mi ubicación actual", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 16, 
                      color: Colors.green),)
                  ],),),
            )
          )
          ],),),
    );
  }
}