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

// import 'package:pert/screens/profileupdate.dart';
import 'package:pert/screens/quarantine.dart';
import 'package:pert/screens/tabbar.dart';
import 'package:pert/screens/whistleblower.dart';
// import 'package:pert/widgets/carouseltile.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';
import 'contact_list.dart';

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
    super.initState();
    // firestore.doc("dashboard/carousel").get().then((snapshot) {
    //   var json = snapshot.data();
    //   if(json!=null){
    //     imgList = json!["imageUrl"];
    //   }
    // });
    imgList = [
      'https://img.freepik.com/free-vector/coronavirus-safety-advice-social-distancing_145666-653.jpg?size=626&ext=jpg',
      'https://image.freepik.com/free-vector/stay-home-stop-coronavirus-design-with-falling-covid-19-virus-cell-light-background-vector-2019-ncov-corona-virus-outbreak-illustration-stay-safe-wash-hand-distancing_1314-2713.jpg',
      'https://img.freepik.com/free-vector/prevent-epidemic-rebound-concept-illustration_114360-3008.jpg?size=626&ext=jpg',
      'http://nshsdenebola.com/wp-content/uploads/2020/05/design-community-concept-illustration_114360-1244.jpg',
      'https://img.freepik.com/free-vector/avoid-coronavirus-transmission-by-touching-face-using-your-hands_152995-117.jpg?size=626&ext=jpg',
      'https://images.squarespace-cdn.com/content/v1/5af8964350a54f8953f49f76/1588352346769-Z4N3FAA22UX9Q0462V8K/ke17ZwdGBToddI8pDm48kEqe6umt3wNhpcc8nDuTgdEUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKc52XC1b42ktSkbHvwZ0rp0W2XZrrZ2NpBu95h_1yZFG_XF6_c-av07vbVOl7yUMXu/Covid+safety+protocols+at+BOCO+Dental?format=1500w'
    ];

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
    final List<Widget> imageSliders = imgList
        .map((item) => Padding(
              padding: const EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () async {
                  var url = item;
                  await launch(Uri.encodeFull(url), enableDomStorage: true);
                },
                child: Material(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  elevation: 5,
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(18)),
                        child: Stack(
                          children: <Widget>[
                            Image.network(item, fit: BoxFit.cover, width: 1000.0),
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
                                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                child: Text(
                                  'No. ${imgList.indexOf(item)} image',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ))
        .toList();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var preferences = await prefs;
          var keys = preferences.getKeys();
          keys.forEach((key) {
            var value = preferences.getStringList(key);
            print("$key :  $value");
          });
          // print(keys);
        },
      ),
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
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
                  aspectRatio: 2,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: imageSliders.toList(),
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
                          profile: widget.user.bioData,
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
}

class Tile extends StatelessWidget {
  String? title;
  String? image;
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
