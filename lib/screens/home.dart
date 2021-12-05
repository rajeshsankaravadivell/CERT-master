import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/controllers/user_controller.dart';

import 'package:pert/models/usermodel.dart';
import 'package:pert/screens/announcementpage.dart';
import 'package:pert/screens/notificationpage.dart';
import 'package:pert/screens/profile.dart';


import 'package:pert/screens/quarantine.dart';
import 'package:pert/screens/tabbar.dart';
import 'package:pert/screens/whistleblower.dart';
import 'package:pert/services/db.dart';
import 'package:pert/widgets/test.dart';

import 'package:url_launcher/url_launcher.dart';
import '../main.dart';
import 'contact_list.dart';
import 'dart:io';


// ignore: unused_import
import 'package:path/path.dart';


//

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  final UserModel user;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  _getToken() {
    _firebaseMessaging.getToken().then((deviceToken) {
      userController.user.fcm = deviceToken;
      userController.user.updateToken(deviceToken!);
      print("Device Token: $deviceToken");
    });
  }

  late List<String> imgList;

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  void initState() {
    widget.user.loadContacts();
    super.initState();

    // firestore.doc("dashboard/carousel").get().then((snapshot) {
    //   var json = snapshot.data();
    //   if(json!=null){
    //     imgList = json!["imageUrl"];
    //   }
    // });


    widget.user.loadContacts();
    Get.put(UserController(widget.user));
    _firebaseMessaging.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];
        print(routeFromMessage);
      }
    });

    ///forground messages
    FirebaseMessaging.onMessage.listen((message)async {
      if (message.notification != null) {
        var preferences = await prefs;
        preferences.setStringList(DateTime.now().toIso8601String().substring(0,19)+".000000", [message.notification!.body.toString(), message.notification!.title.toString()]);
        print(message.notification!.body);
        print(message.notification!.title);
        print("message");
      }
    });

    FirebaseMessaging.onBackgroundMessage((message) async {
      if (message.notification != null) {
        var preferences = await prefs;
        preferences.setStringList(DateTime.now().toIso8601String().substring(0,19)+".000000", [message.notification!.body.toString(), message.notification!.title.toString()]);
        print(message.notification!.body);
        print(message.notification!.title);
        print("message");
      }
      return null;
    });

    ///background msg
    FirebaseMessaging.onMessageOpenedApp.listen((message) async{
      if (message.notification != null) {
        var preferences = await prefs;
        preferences.setStringList(DateTime.now().toIso8601String(), [message.notification!.body.toString(), message.notification!.title.toString()]);
        print(message.notification!.body);
        print(message.notification!.title);
        print("message");
      }
    });
    _firebaseMessaging.setForegroundNotificationPresentationOptions(alert: true);
    _firebaseMessaging.subscribeToTopic('Announcement');

    _getToken();
  }

  // List<int> list = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: ()
      //   async{
      //     var preferences = await prefs;
      //     var keys = preferences.getKeys();
      //     keys.forEach((key) {
      //       var value = preferences.getStringList(key);
      //       print("$key :  $value");
      //     });
      //     // print(keys);
      //   },
      // ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.black),
                ),
                content: const Text('Are you sure you wish to logout?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      authController.auth.logout();
                      Navigator.pop(context, 'OK');
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          icon: const Icon(
            Icons.logout,
            color: Color(0xFFED392D),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.circle_notifications_outlined,
                size: 30,
              ),
              color: const Color(0xFFED392D),
              onPressed: () {


                Get.to(()=>NotificationPage());
              },
            ),
          )
        ],
        title: Center(
          child: Container(
            // padding: EdgeInsets.only(left: 30),
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Image.asset(
                'assets/studentloginpage/iukl_logo.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ),
      // backgroundColor: kprimaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [

              FutureBuilder(
                future: getCaruosel(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      snapshot.data["imageUrl"].forEach((elemnt) {
                        _paths.add(Paths(type: PathType.url, path: elemnt.toString()));
                      });
                      print(_paths);
                    }
                    return
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200,
                          autoPlay: true,
                          aspectRatio: 2,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                        ),
                        items: getItems(),
                      );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              GridView(

                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                children: [
                  InkWell(
                    onTap: () => Get.to(() => covidstatus(
                          user: widget.user,
                        )),
                    child: Tile(
                      title: 'Covid Status',
                      image: 'assets/high-fever-512x512-1833393.png',
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactHistoryDetails(contactHistory: widget.user.contactHistory),
                      ),
                    ),
                    child: Tile(
                      title: 'Contact History',
                      image: 'assets/ContactHistory.png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => QuarantinePage(
                            user: widget.user,
                          ));
                    },
                    child: Tile(
                      title: 'Quarantine',
                      image: 'assets/virus-protection-512x512-1833388.png',
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(() => WhistleBlower(
                          userModel: widget.user,
                        )),
                    child: Tile(
                      title: 'Whistle Blower',
                      image: 'assets/studenthomepage/whistleblower.png',
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(() => AnnouncementWidget()),
                    child: Tile(
                      title: 'Announcement',
                      image: 'assets/studenthomepage/announcement.png',
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(() => ProfilePage(

                          userModel: widget.user,
                        )),
                    child: Tile(
                      title: 'Profile',
                      image: 'assets/studenthomepage/profile.png',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  // Paths? _path;
  late List<Paths?> _paths = [];
  List<Widget> getItems() {
    List<Widget> widgets = [];
    _paths.forEach((element) {
      widgets.add(getTile(element!));
    });
    return widgets;
  }

  Widget getTile(Paths path) {
    switch (path.type) {
      case PathType.url:
        return NetworkImage(url: path.path!);

      case PathType.file:
        return FileImage(path: path.path!);

      case PathType.noPath:
        return NullImage();
    }
  }




}

class Tile extends StatelessWidget {
  final String? title;
  final String? image;
  Tile({Key? key, this.title, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 5,
        child: Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(18)),
          child: GridTile(
            footer: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title!,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                image!,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class NetworkImage extends StatelessWidget {
  const NetworkImage({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    // File file = File(url);
    return
      Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () async {

            await launch(url, enableDomStorage: true);
          },
          child: Material(

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            elevation: 5,
            child: Container(
              height: 10,
              margin: const EdgeInsets.all(4),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  child: Stack(
                    children: <Widget>[
                      Stack(
                        children: [
                          Image.network(url, fit: BoxFit.cover, width: 1000.0),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),

                            ),
                          ),
                        ],
                      )


                    ],
                  )
              ),
            ),
          ),
        ),
      );
  }
}
class FileImage extends StatelessWidget {
  const FileImage({
    Key? key,
    required this.path,
  }) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    // File file = File(path);
    return Padding(
      padding: EdgeInsetsDirectional.all(12),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.42,
        decoration: BoxDecoration (
          color: Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Image.file(File(path)),
            Positioned(top: 15, right: 15, child: Icon(Icons.close_rounded))
          ],
        ),
      ),
    );
  }
}