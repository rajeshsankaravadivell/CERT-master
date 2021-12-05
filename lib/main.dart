import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pert/controllers/user_controller.dart';
import 'package:pert/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controllers/auth_controller.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(message.notification!.body);
  print(message.notification!.title);
  print("Handling a background message: ${message.messageId}");
  var preferences = await prefs;
  print(DateTime.now().toIso8601String().substring(0,19)+".000000");
  preferences.setStringList(DateTime.now().toIso8601String().substring(0,19)+".000000", [message.notification!.body.toString(), message.notification!
      .title.toString()]);
  // sharedPreferenbcece
}



final Future<SharedPreferences> prefs = SharedPreferences.getInstance();


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Get.put(AuthController());
  var preferences = await prefs;
  Get.put(PreferencesController(preferences));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(


        canvasColor: Colors.white,
        // scaffoldBackgroundColor:  Colors.white38,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
          backgroundColor: MaterialStateProperty.all(
            Color(0xFFEF4C43),
          ),
        )),
        iconTheme: const IconThemeData(color: Color(0xFFEF4C43)),
        tabBarTheme: const TabBarTheme(labelColor: Colors.red,

        ),
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(color: Colors.redAccent),
      ),
      home: const SplashScreen(),
    );
  }
}
