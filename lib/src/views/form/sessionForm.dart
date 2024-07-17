import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:thepointapp/firebase_options.dart';
import 'package:thepointapp/src/models/pushNotification.dart'; 
import 'package:thepointapp/src/msic/style.dart';
import 'package:thepointapp/src/util/permissions.dart';
import 'package:thepointapp/src/viewModel/authentificationViewModel.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
}

class SessionForm extends AuthentificationViewModel { 
  
  late FirebaseMessaging _messaging;
  int _totalNotifications = 0;
  late PushNotification _notificationInfo; 

  void registerNotification() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message){
        print('Message title: ${message.notification?.title}');

        PushNotification notification = PushNotification(
          title: message.notification?.title ?? '', 
          body: message.notification?.body ?? '',
          dataTitle: message.data['title'] ?? '',
          dataBody: message.data['body'] ?? '');

        setState(() {
          _notificationInfo = notification;
          _totalNotifications++;
        });

        if(_notificationInfo != null) {
          showSimpleNotification(
            Text(_notificationInfo.title), 
            subtitle: Text(_notificationInfo.body ?? ''),
            background: Colors.cyan.shade700,
            duration: Duration(seconds: 2));
        }
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  checkForInitialMessage() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if(initialMessage != null) {
      PushNotification notification = PushNotification(
      title: initialMessage.notification?.title ?? '', 
      body: initialMessage.notification?.body ?? '',
      dataTitle: initialMessage.data['title'] ?? '',
      dataBody: initialMessage.data['body'] ?? '');

      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    } 
  }

  @override
  void initState()  {
    
    _totalNotifications = 0;
    registerNotification();
    checkForInitialMessage();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      PushNotification notification = PushNotification(
        title: message.notification?.title ?? '', 
        body: message.notification?.body ?? '',
        dataTitle: message.data['title'] ?? '',
        dataBody: message.data['body'] ?? '');

        setState(() {
          _notificationInfo = notification;
          _totalNotifications++;
        });
    });

    super.initState();  
    try {
      setState(() {

        Permissions.checkLocationPermission(); 
      });
    }catch (er){
      print(er.toString());
    }
  }

  @override
  void dispose() { 
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/illustration-1.png',
                      height: 540,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Text('Inicio sesión con:',
                  style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20.0, 
                          color: Colors.black38,
                          fontWeight: FontWeight.bold)),
                  const SizedBoxH20(),
                  CupertinoButton(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.indigo,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text( 'Entrar con número de celular', 
                        style: style16White,),
                      ],), 
                      onPressed: () {   
                        signInPhone();
                      }
                    ),
                  const SizedBoxH10(),
                ],
              ),
            ),
            ]
          )
        ),
    );
  }
}