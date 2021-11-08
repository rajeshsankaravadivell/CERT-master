import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pert/constants/colors.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/models/usermodel.dart';
import 'package:pert/widgets/customtile.dart';

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
                                  text: 'Symptomatic',
                                  style: TextStyle(fontWeight: FontWeight.normal, color: cardcolor, fontSize: 16.0),
                                ),
                              ],
                              text: 'Type : ',
                              style: TextStyle(fontWeight: FontWeight.bold, color: cardcolor, fontSize: 18.0),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
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
                      const SizedBox(
                        height: 8.0,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Swab',
                              style: TextStyle(fontWeight: FontWeight.normal, color: cardcolor, fontSize: 16.0),
                            ),
                          ],
                          text: 'Test Method : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: cardcolor, fontSize: 18.0),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Not vaccinated',
                        style: TextStyle(color: cardcolor, fontSize: 17.0),
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
