import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pert/landing_page.dart';
import 'package:pert/splashscreen.dart';
import 'package:pert/widgets/carouseltile.dart';

import 'controllers/auth_controller.dart';
import 'login.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Get.put(AuthController());
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
