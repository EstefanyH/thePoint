import 'package:flutter/material.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({Key? key, this.text = ""}) : super(key: key);

final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Center(child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LinearProgressIndicator(color: Colors.indigo,),
          Text(text, 
          style: const TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w300),)
          
          ],),),),);
  }
}