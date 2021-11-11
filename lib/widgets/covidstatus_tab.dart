

import 'package:flutter/material.dart';
import 'package:pert/constants/colors.dart';
import 'package:pert/constants/constants.dart';


class CovidStatusTab extends StatefulWidget {
  const CovidStatusTab({Key? key}) : super(key: key);

  @override
  _CovidStatusTabState createState() => _CovidStatusTabState();
}

class _CovidStatusTabState extends State<CovidStatusTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Covid Status', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700, fontSize: 18.0),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // height: 100,
            child: Stack(
              children: [
                Image.asset(
                  'assets/studenthomepage/MaskGroup1.png',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: userController.user.covidInfo!.type,
                                  style: TextStyle(fontWeight: FontWeight.normal, color: cardcolor, fontSize: 15.0),
                                ),
                              ],
                              text: 'Type                          : ',
                              style: TextStyle(fontWeight: FontWeight.bold, color: cardcolor, fontSize: 15.0),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            width: 100,
                            child: Center(
                              child: Text(
                                'Negative',
                                style: TextStyle(fontWeight: FontWeight.bold, color: cardcolor),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green[800],
                              borderRadius: BorderRadius.circular(14),
                            ),
                          )
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:userController.user.covidInfo!.method,
                                style: TextStyle(fontWeight: FontWeight.normal, color: cardcolor, fontSize: 15.0),
                              ),
                            ],
                            text: 'Test Method            : ',
                            style: TextStyle(fontWeight: FontWeight.bold, color: cardcolor, fontSize: 15.0),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:userController.user.covidInfo!.vaccinated.toString(),
                                style: TextStyle(fontWeight: FontWeight.normal, color: cardcolor, fontSize: 15.0),
                              ),
                            ],
                            text: 'Vaccination Status : ',
                            style: TextStyle(fontWeight: FontWeight.bold, color: cardcolor, fontSize: 15.0),
                          ),
                        ),
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
        ),
      ],
    );
  }
}
