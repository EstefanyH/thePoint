import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thepointapp/src/network/loginService.dart';
import 'package:thepointapp/src/route/routeManager.dart';

void main() async {
  /*
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController)); */
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
        ChangeNotifierProvider(create: (context) => LoginService()),
        //ChangeNotifierProvider(create: (context) => AccountService()),
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