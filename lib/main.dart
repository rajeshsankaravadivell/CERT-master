import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pert/landing_page.dart';
import 'package:pert/widgets/carouseltile.dart';

import 'controllers/auth_controller.dart';
import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
      home: const LandingPage(),
    );
  }
}
