import 'package:flutter/material.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  List<String> notification =["Hello", "World", "Luther"];



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: notification.length,
        itemBuilder: (context, index) {
      return Text(notification[index], style: TextStyle(color: Colors.white));
    });
    // return Container();
  }

}
