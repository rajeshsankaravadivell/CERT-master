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
    messagesList;
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
          return // Generated code for this Row Widget...
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/user_2@2x.png',
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Alex Edwards',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF15212B),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.7, 0),
                              child: Text(
                                '[Time Stamp]',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: Color(0xFF57636C),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 0),
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing eiusmod tempor incididunt ut dolor sit amet…',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF8B97A2),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
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
