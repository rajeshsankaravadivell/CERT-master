import 'package:flutter/material.dart';
import 'package:pert/constants/colors.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({Key? key}) : super(key: key);

  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Announcement'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: bgcolor,
                size: 35,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Image.asset(
                    'assets/studenthomepage/announcement.png',
                    height: MediaQuery.of(context).size.height * 0.20,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: kprimaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Covid SOP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                height: 40,
                                child: RichText(
                                  maxLines: 5,
                                  text: const TextSpan(
                                      text: 'A Sample Text : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text: 'Sample text',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                        )
                                      ]),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: kprimaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Covid SOP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                height: 40,
                                child: RichText(
                                  maxLines: 5,
                                  text: const TextSpan(
                                      text: 'A Sample Text : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text: 'Sample text',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                        )
                                      ]),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: kprimaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Covid SOP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                height: 40,
                                child: RichText(
                                  maxLines: 5,
                                  text: const TextSpan(
                                      text: 'A Sample Text : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text: 'Sample text',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                        )
                                      ]),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
