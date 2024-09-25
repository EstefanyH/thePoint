 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:thepointapp/firebase_options.dart';
import 'package:thepointapp/src/models/pushNotification.dart'; 
import 'package:thepointapp/src/network/loginService.dart';
import 'package:thepointapp/src/network/mapService.dart';
import 'package:thepointapp/src/network/registerService.dart'; 
import 'package:thepointapp/src/network/sessionService.dart';
import 'package:thepointapp/src/route/routeManager.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print('Handling background message: ${message.messageId}');
  
  RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

  if (initialMessage != null) {
    PushNotification notification = PushNotification(
      title: initialMessage.notification?.title ?? '', 
      body: initialMessage.notification?.body ?? '',
      dataTitle: initialMessage.data['title'] ?? '',
      dataBody: initialMessage.data['body'] ?? '');
  }

}
void main() async {   
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  User? user;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    user = FirebaseAuth.instance.currentUser; 
    _firebaseMessaging.getToken().then((token){
      print('Firebase token: $token');
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received Message: ${message.notification?.body}');
    });
  }
  
  @override
  Widget build(BuildContext context) {
 
    return OverlaySupport(
      child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SessionService()),
        ChangeNotifierProvider(create: (context) => LoginService()),
        ChangeNotifierProvider(create: (context) => MapService()),
        ChangeNotifierProvider(create: (context) => RegisterService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteManager.onGenerationRoute,
        initialRoute: RouteManager.loadingPage,
        theme: ThemeData( 
          primarySwatch: Colors.indigo
          ),
      ),
    ));
  }
}