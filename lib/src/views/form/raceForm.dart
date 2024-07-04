import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thepointapp/src/msic/style.dart';
import 'package:thepointapp/src/viewModel/raceViewModel.dart';

class RaceForm extends RaceViewModel {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(    
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue,
                      child: Center(child: Text('Top Left', style: TextStyle(color: Colors.white))),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0), 
                        child: Column(
                          children: [
                            const Text('Te llevo ah..', style: titleStyleIndigo,),
                            TextFormField(
                              enabled: false,
                              decoration: const InputDecoration(
                                counterText: '',
                                labelText: 'Origen',
                                border: OutlineInputBorder(),
                              ),
                              readOnly: true,
                              onTap: () { 
                                goToMapView(); 
                              }
                            ),
                            const SizedBoxH10(),
                            TextFormField(
                              enabled: false,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                counterText: '',
                                labelText: 'Llegada',
                                border: OutlineInputBorder(),
                              ),
                              onTap: () { 
                                goToMapView(); 
                              }
                            ),
                            const SizedBoxH10(),
                            CupertinoButton(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              color: Colors.indigo,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Text( 'Taxi...', 
                                style: style16White,),
                              ],), 
                              onPressed: () { 
                                goToMapView();
                              }
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}