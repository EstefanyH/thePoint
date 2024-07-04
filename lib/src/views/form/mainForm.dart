import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:thepointapp/src/viewModel/mainViewModel.dart';

class MainForm extends MainViewModel {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
          controller: pageController,
          children: widgetOptions,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.car_crash),
            label: 'Viaje'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign_outlined),
            label: 'Promociones'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil')
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }

}