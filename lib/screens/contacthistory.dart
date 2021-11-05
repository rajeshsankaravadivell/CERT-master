import 'package:flutter/material.dart';
import 'package:pert/constants/colors.dart';

class Contacthistory extends StatefulWidget {
  const Contacthistory({Key? key}) : super(key: key);

  @override
  _ContacthistoryState createState() => _ContacthistoryState();
}

class _ContacthistoryState extends State<Contacthistory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: const Text('Contact History'),
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
          body: Column(
            children: [
              const SizedBox(
                height: 25.0,
              ),
              Container(
                // height: 100,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/studenthomepage/MaskGroup1.png',
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Group Id',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: cardcolor,
                                          fontSize: 16.0),
                                    ),
                                  ],
                                  text: '1111',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: cardcolor,
                                      fontSize: 18.0),
                                ),
                              ),
                              const Spacer(),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: cardcolor,
                                          fontSize: 16.0),
                                    ),
                                  ],
                                  text: 'Ben',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: cardcolor,
                                      fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Spend Time',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: cardcolor,
                                          fontSize: 16.0),
                                    ),
                                  ],
                                  text: '23 min',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: cardcolor,
                                      fontSize: 18.0),
                                ),
                              ),
                              const Spacer(),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Device Id',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: cardcolor,
                                          fontSize: 16.0),
                                    ),
                                  ],
                                  text: '1001',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: cardcolor,
                                      fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: kprimaryColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                // height: 100,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/studenthomepage/MaskGroup1.png',
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Group Id',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: cardcolor,
                                          fontSize: 16.0),
                                    ),
                                  ],
                                  text: '1111',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: cardcolor,
                                      fontSize: 18.0),
                                ),
                              ),
                              const Spacer(),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: cardcolor,
                                          fontSize: 16.0),
                                    ),
                                  ],
                                  text: 'Ben',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: cardcolor,
                                      fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Spend Time',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: cardcolor,
                                          fontSize: 16.0),
                                    ),
                                  ],
                                  text: '23 min',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: cardcolor,
                                      fontSize: 18.0),
                                ),
                              ),
                              const Spacer(),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Device Id',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: cardcolor,
                                          fontSize: 16.0),
                                    ),
                                  ],
                                  text: '1001',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: cardcolor,
                                      fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.green[700]!.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          )),
    );
  }
}
