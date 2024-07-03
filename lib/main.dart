import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thepointapp/src/network/loginService.dart';
import 'package:thepointapp/src/network/sessionService.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/util/firebaseOptions.dart';

void main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);

  /*await Firebase.initializeApp(
    options: const FirebaseOptions(
          apiKey: "AIzaSyD3wST55DRDTD2Dmj8rvrlwnmnMR7EOZHU",
          appId:  "1:848613056189:web:9d18e75518499b79aa61d4",
          messagingSenderId: "409301001791",
          projectId: "thepointapp-9227b",
          authDomain: "thepointapp-9227b.firebaseapp.com",
          storageBucket: "thepointapp-9227b.appspot.com"
      )); */
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addObserver(this);
  }
 
  
  @override
  Widget build(BuildContext context) {
 
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SessionService()),
        ChangeNotifierProvider(create: (context) => LoginService()),
        //ChangeNotifierProvider(create: (context) => ChatService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteManager.onGenerationRoute,
        initialRoute: RouteManager.loadingPage,
        theme: ThemeData( 
          primarySwatch: Colors.indigo
          ),
      ),
    );
  }
}