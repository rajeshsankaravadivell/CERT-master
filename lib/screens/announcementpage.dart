import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pert/models/admin.dart';
import 'package:pert/models/announcements.dart';
import 'package:pert/models/profileModel.dart';
import 'package:pert/services/db.dart';

class AnnouncementWidget extends StatefulWidget {
  AnnouncementWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _AnnouncementWidgetState createState() => _AnnouncementWidgetState();
}

class _AnnouncementWidgetState extends State<AnnouncementWidget> {
  int page = 1;
  List<Announcement> items = [];
  List<DocumentSnapshot> snapshots = [];
  List<String> urls = [];
  @override
  @override
  void initState() {
    super.initState();
    _loadData(null);
  }

  bool isLoading = false;

  Future _loadData(DocumentSnapshot? snap) async {
    // perform fetching data delay
    QuerySnapshot<Map<String, dynamic>> snaplist = await Announcement.getAnnouncement(snap);
    snapshots = snaplist.docs;

    print("load more");
    // update data and loading status
    setState(() {
      for (var snap in snaplist.docs) {
        if (snap.exists) {
          items.add(Announcement.fromJson(snap.data()));

        }
      }
      print('items: ' + items.toString());
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEF4C43),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          'Covid Status',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),
      //   backgroundColor: Color(0xFFEF4C43),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       SizedBox(
            //         height: MediaQuery.of(context).size.height * 0.055,
            //         child: ElevatedButton(
            //           onPressed: () {
            //
            //           },
            //           child: Icon(Icons.person_add),
            //           style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)))),
            //         ),
            //       ),
            //       SizedBox(
            //         width: MediaQuery.of(context).size.width * 0.7,
            //
            //         // elevation: 5,
            //         //
            //         // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            //         child: Card(
            //           elevation: 4,
            //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            //           child: TextFormField(
            //             controller: null,
            //             decoration: InputDecoration(
            //               hintText: 'Search',
            //               suffixIcon: IconButton(
            //                 icon: Icon(Icons.search),
            //                 onPressed: () {},
            //               ),
            //               enabledBorder: UnderlineInputBorder(
            //                 borderSide: BorderSide(
            //                   color: Color(0x00000000),
            //                   width: 20,
            //                 ),
            //                 borderRadius: BorderRadius.circular(20),
            //               ),
            //               focusedBorder: UnderlineInputBorder(
            //                 borderSide: BorderSide(
            //                   color: Color(0x00000000),
            //                   width: 20,
            //                 ),
            //                 borderRadius: BorderRadius.circular(20),
            //               ),
            //               filled: true,
            //               fillColor: Color(0xFFF7F7F7),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Divider(
            //   thickness: 1,
            // ),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (!isLoading && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                    _loadData(snapshots.last);
                    // start loading data
                    setState(() {
                      isLoading = true;
                    });
                  }
                  return true;
                },
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      announcement: items[index],
                    );
                  },
                ),
              ),
            ),
            Container(
              height: isLoading ? 50.0 : 0,
              color: Colors.transparent,
              child: Center(
                child: new CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.announcement,
  }) : super(key: key);
  final Announcement announcement;
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white,
      fontSize: 15,
    );
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
          color: Color(0xFF5C5C5C),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/corona image.png',
            ).image,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // AspectRatio(
              //   aspectRatio: 1,
              //   child: Container(
              //     // color: Colors.amber,
              //     height: double.maxFinite,
              //     child: Center(child: Image.asset('assets/images/addstaff.png', fit: BoxFit.contain)),
              //   ),
              // ),
              Expanded(
                flex: 4,
                child: Container(
                  // color: Colors.yellow,
                    height: double.maxFinite,
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Name : ${announcement.createdDate}",
                              textAlign: TextAlign.left,
                              style: textStyle,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "ID : ${announcement.description}",
                              textAlign: TextAlign.left,
                              style: textStyle,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              Expanded(
                flex: 4,
                child: Container(

                  height: double.maxFinite,
                  child: Column(
                    children: [
                      Expanded(
                        child: Text('For MoreDetails'),
                      ),
                      Expanded(
                        child: ElevatedButton(child:Icon(Icons.download),onPressed: (){},)
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.announcement, this.url}) : super(key: key);
  final Announcement announcement;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return   Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.person),),
            title: Text('${announcement.title}'),
            subtitle: Text(
              '${announcement.createdDate}',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              '${announcement.description}',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Image.network("https://www.shriramgi.com/news-events/wp-content/uploads/2020/10/SGI-corona-blog-image.png"),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(

                onPressed: () {
                  // Perform some action
                },
                child: const Text('Download'),
              ),

            ],
          ),

        ],
      ),
    );
  }
}

