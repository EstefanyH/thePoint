
import 'package:flutter/widgets.dart';
import 'package:thepointapp/src/views/page/mainPage.dart';
import 'package:thepointapp/src/views/page/profilePage.dart';
import 'package:thepointapp/src/views/page/promotionPage.dart';
import 'package:thepointapp/src/views/page/racePage.dart';

class MainViewModel extends State<MainPage> {
  
  int selectedIndex = 0;
  PageController pageController = PageController();


  List<Widget> widgetOptions = <Widget>[
    const RacePage(),
    const PromotionPage(),
    const ProfilePage(),
  ];

  void onItemTapped(int index) {
    try {   
      setState(() {
        selectedIndex = index;
      }); 
       pageController.jumpToPage(index);
    } catch(error){
      print(error.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}