import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/controllers/user_controller.dart';
import 'package:pert/login.dart';
import 'package:pert/models/usermodel.dart';
import 'package:pert/screens/announcementpage.dart';
import 'package:pert/screens/notificationpage.dart';
import 'package:pert/screens/profile.dart';
import 'package:pert/screens/quarantine.dart';
import 'package:pert/screens/tabbar.dart';
import 'package:pert/screens/whistleblower.dart';
import 'package:pert/widgets/carouseltile.dart';
import 'contact_list.dart';



//


class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  final UserModel user;
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  final FirebaseMessaging _firebaseMessaging= FirebaseMessaging.instance;
  _getToken(){
    _firebaseMessaging.getToken().then((deviceToken) {
      userController.user.fcm=deviceToken;
      userController.user.updateUser();
      print("Device Token: $deviceToken");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  void initState() {
    super.initState();
    Get.put(UserController(widget.user));
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
    
    
    
    _getToken();



  }

  // List<int> list = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,

        leading: IconButton(
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(
                    'Signout',
                  style: TextStyle(color: Colors.black),
                ),
                content: const Text('Are you sure want to Logout'),
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
        actions:  [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.notifications),
              color: const Color(0xFFED392D),
               onPressed: () {  },
            ),
          )
        ],
        title: Center(
          child: Container(
            // padding: EdgeInsets.only(left: 30),
            height: 50,
            child: Image.asset('assets/studentloginpage/iukl_logo.png',fit: BoxFit.fitHeight,),
          ),
        ),

      ),
      // backgroundColor: kprimaryColor,
      body:SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.all(8),
          child:Column(

            children: [
              // Container(
              //   color: bgcolor,
              //   height: MediaQuery.of(context).size.height * 0.10,
              //   child: Row(
              //     children: [
              //       Image.asset(
              //         'assets/studentloginpage/iukl_logo.png',
              //         fit: BoxFit.cover,
              //       ),
              //       const Spacer(),
              //       IconButton(
              //         onPressed: () {},
              //         icon: Icon(
              //           Icons.notifications,
              //           color: kprimaryColor,
              //           size: 35,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              CarouselSlider(

                options: CarouselOptions(
                  height: 150,
                  autoPlay:false,
                  aspectRatio: 2,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: imageSliders

                // imgList
                //     .map((item) => Material(
                //       elevation: 5,
                //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                //       child: Container(
                //         color: kprimaryColor,
                //
                //         height:MediaQuery.of(context).size.height * 0.18 ,
                //         width: MediaQuery.of(context).size.width*0.956,
                //
                //         child: Center(child: Image.network(item, fit: BoxFit.cover, width: 1000)),
                //
                //
                //       ),
                //     ))
                //     .toList(),
              ),
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: [
                  InkWell(
                    onTap: () => Get.to(()=>MyStatefulWidget()),
                    child: Tile(
                      title: 'Covid Status',
                      image: 'assets/studenthomepage/covidstatus.png',
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  ContactHistoryDetails(contactHistory: widget.user.contactHistory),
                      ),
                    ),
                    child: Tile(
                      title: 'Contact History',
                      image: 'assets/studenthomepage/covidhistory.png',
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  QuarantinePage(quarantine: userController.user.quarantine,),
                      ),
                    ),
                    child: Tile(
                      title: 'Quarantine',
                      image: 'assets/studenthomepage/quarantine.png',
                    ),
                  ),
                  InkWell(
                    onTap: ()=> Get.to(()=>WhistleBlower()),

                    child: Tile(
                      title: 'Whistle Blower',
                      image: 'assets/studenthomepage/whistleblower.png',
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(()=>AnnouncementWidget()),
                    child: Tile(
                      title: 'Announcement',
                      image: 'assets/studenthomepage/announcement.png',
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(()=>ProfilePage(profile: widget.user.bioData,
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
          decoration: BoxDecoration(
              color: Colors.grey.shade100, borderRadius: BorderRadius.circular(18)),
          child: GridTile(
            footer: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
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
