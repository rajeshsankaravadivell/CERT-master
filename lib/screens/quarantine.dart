import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pert/constants/colors.dart';
import 'package:pert/models/usermodel.dart';

class QuarantinePage extends StatefulWidget {
  QuarantinePage({Key? key, this.quarantine, required this.user}) : super(key: key);
  final UserModel user;

  final Quarantine? quarantine;

  @override
  _QuarantinePageState createState() => _QuarantinePageState();
}

class _QuarantinePageState extends State<QuarantinePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Quarantine History'),
          centerTitle: true,
        ),
        body:  Padding(
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
                    'assets/studenthomepage/quarantinehistroy.png',
                    height: MediaQuery.of(context).size.height * 0.35,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Your Recent Quarantine',
                  style: TextStyle(
                    color: kprimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: widget.quarantine == null ? const Center(child :Text("No records found. You are not in Quarantine")) :Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 70,
                                child: RichText(
                                  maxLines: 5,
                                  text: TextSpan(
                                      text: 'Address : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600]),
                                      children: [
                                        TextSpan(
                                          text: widget.quarantine!.location.place,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey[500]),
                                        )
                                      ]),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Block :",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[600]),
                                    children: [
                                      TextSpan(
                                        text: widget.quarantine!.location.block,
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey[500]),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.calendar_today,
                                  size: 30,
                                ),
                              ),
                              Text(
                                '20/10/2021',
                                style: TextStyle(
                                    color: kprimaryColor, fontSize: 16),
                              ),
                              Text(
                                '28/10/2021',
                                style: TextStyle(
                                    color: kprimaryColor, fontSize: 16),
                              ),
                              Text(
                                'Duration : 5 days',
                                style: TextStyle(
                                    color: kprimaryColor, fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Text(
                //   'Quarantine History',
                //   style: TextStyle(
                //     color: Colors.grey[700],
                //     fontWeight: FontWeight.bold,
                //     fontSize: 18,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // SizedBox(
                //   width: double.infinity,
                //   child: Card(
                //     color: kprimaryColor,
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               SizedBox(
                //                 height: 40,
                //                 child: RichText(
                //                   maxLines: 5,
                //                   text: const TextSpan(
                //                       text: 'Address : ',
                //                       style: TextStyle(
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.white),
                //                       children: [
                //                         TextSpan(
                //                           text: 'Sample Adddress',
                //                           style: TextStyle(
                //                               fontWeight: FontWeight.normal,
                //                               color: Colors.white),
                //                         )
                //                       ]),
                //                 ),
                //               ),
                //               RichText(
                //                 text: const TextSpan(
                //                     text: 'Block : ',
                //                     style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.white),
                //                     children: [
                //                       TextSpan(
                //                         text: '5A',
                //                         style: TextStyle(
                //                             fontWeight: FontWeight.normal,
                //                             color: Colors.white),
                //                       )
                //                     ]),
                //               ),
                //             ],
                //           ),
                //           const Spacer(),
                //           Column(
                //             children: const [
                //               Padding(
                //                 padding: EdgeInsets.all(8.0),
                //                 child: Icon(
                //                   Icons.calendar_today,
                //                   size: 30,
                //                   color: Colors.white,
                //                 ),
                //               ),
                //               Text(
                //                 '20/10/2021',
                //                 style: TextStyle(
                //                     color: Colors.white, fontSize: 16),
                //               ),
                //               Text(
                //                 '28/10/2021',
                //                 style: TextStyle(
                //                     color: Colors.white, fontSize: 16),
                //               ),
                //               Text(
                //                 'Duration : 5 days',
                //                 style: TextStyle(
                //                     color: Colors.white, fontSize: 16),
                //               ),
                //             ],
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
