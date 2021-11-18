import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  final FirebaseMessaging _firebaseMessaging =FirebaseMessaging.instance;

  void initState() {
    super.initState();
    _firebaseMessaging.getInitialMessage().then((message){
      if(message!=null){
        final routeFromMessage =message.data["route"];
        print(routeFromMessage);
      }

    } );
    ///forground messages
    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification!=null){
        print(message.notification!.body);
        print(message.notification!.title);
      }
    });
    ///background msg
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage =message.data["route"];
      print(routeFromMessage);


    });

    _firebaseMessaging.setForegroundNotificationPresentationOptions(alert: true);


    _firebaseMessaging.subscribeToTopic('Announcement');







  }








  late List<Message> messagesList;

  _setMessage(Map<String, dynamic> message) {
    final notification = message['notification'];
    final data = message['data'];
    final String title = notification['title'];
    final String body = notification['body'];
    String mMessage = data['message'];
    print("Title: $title, body: $body, message: $mMessage");
    setState(() {
      Message msg = Message(title, body, mMessage);
      messagesList.add(msg);
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),

      ),
      body: ListView.builder(

        itemCount: null==messagesList?0:messagesList.length,
        itemBuilder: (BuildContext context,int index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(




            ),
          );

      },

      ),

    );
  }
}


class Message {
  String? title;
  String? body;
  String? message;
  Message(title, body, message) {
    this.title = title;
    this.body = body;
    this.message = message;
  }
}
