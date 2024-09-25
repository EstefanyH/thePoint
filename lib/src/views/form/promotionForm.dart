import 'package:flutter/material.dart';
import 'package:thepointapp/src/viewModel/promotionViewModel.dart';

class PromotionsForm extends PromotionViewModel {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Promociones')),
    );
  }

}