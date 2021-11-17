import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';



class DemoMessaging extends StatefulWidget {
  const DemoMessaging({Key? key}) : super(key: key);

  @override
  _DemoMessagingState createState() => _DemoMessagingState();
}

class _DemoMessagingState extends State<DemoMessaging> {

  final FirebaseMessaging _firebaseMessaging= FirebaseMessaging.instance;
  _getToken(){
    _firebaseMessaging.getToken().then((deviceToken) {

      print("Device");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(



    );
  }
}
