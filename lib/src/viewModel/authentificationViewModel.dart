import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:thepointapp/firebase_options.dart';
import 'package:thepointapp/src/models/pushNotification.dart';
import 'package:thepointapp/src/network/sessionService.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/views/page/sessionPage.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
}

class AuthentificationViewModel extends State<SessionPage> {
  SessionService get sessionManager =>  context.read<SessionService>();  

  @override
  void initState(){
    super.initState();
    
  }
  
  late FirebaseMessaging _messaging;
  int totalNotifications = 0;
  late PushNotification notificationInfo; 

  void registerNotification() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

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
          notificationInfo = notification;
          totalNotifications++;
        });

        showSimpleNotification(
          Text(notificationInfo.title), 
          subtitle: Text(notificationInfo.body ?? ''),
          background: Colors.cyan.shade700,
          duration: Duration(seconds: 2));
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
        notificationInfo = notification;
        totalNotifications++;
      });
    } 
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  void signInWithGoogle () async {
    try {
      /*var result = await sessionManager.authWithGoogle();      
      if (result!.user?.displayName != null)
      {
        Navigator.popAndPushNamed(context, RouteManager.loginPage);
      }*/
    } catch(e) {
      print(e.toString());
    }
  }

  void signInPhone() {
    Navigator.popAndPushNamed(context, RouteManager.phonePage);
  }

  void signOutPhone() {
    Navigator.popAndPushNamed(context, RouteManager.registerPage);
  }
 
}