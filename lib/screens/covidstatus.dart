import 'package:flutter/material.dart';
import 'package:pert/constants/colors.dart';

class CovidStatusPage extends StatefulWidget {
  const CovidStatusPage({Key? key}) : super(key: key);

  @override
  _CovidStatusPageState createState() => _CovidStatusPageState();
}

class _CovidStatusPageState extends State<CovidStatusPage> {
  String testmethod = 'swab';
  String typegroupValue = '';
  bool vaccinegroupValue = false;
  bool resultgroupValue = false;
  Widget assessment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
          child: Text(
            'Vaccinated',
            style: TextStyle(
                color: kprimaryColor,
                fontSize: 18.5,
                fontWeight: FontWeight.bold),
          ),
        ),
        RadioListTile<bool>(
            title: const Text('Yes'),
            value: true,
            groupValue: vaccinegroupValue,
            onChanged: (val) {
              setState(() {
                vaccinegroupValue = val!;
              });
            }),
        RadioListTile<bool>(
            title: const Text('No'),
            value: false,
            groupValue: vaccinegroupValue,
            onChanged: (val) {
              setState(() {
                vaccinegroupValue = val!;
              });
            }),
        const SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Submit',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
              kprimaryColor,
            )),
          ),
        )
      ],
    );
  }

  Widget? _animatedwidget;

  Widget? update() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                                text: 'Symptomatic',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: cardcolor,
                                    fontSize: 16.0),
                              ),
                            ],
                            text: 'Type : ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: cardcolor,
                                fontSize: 18.0),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Negative',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: cardcolor),
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
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: cardcolor,
                                fontSize: 16.0),
                          ),
                        ],
                        text: 'Test Method : ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: cardcolor,
                            fontSize: 18.0),
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
        const SizedBox(
          height: 15.0,

        ),
        Text(
          'Report Your Test Now !',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
              fontSize: 18.0),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 5,
              shadowColor: Colors.grey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    onChanged: (String? v) {
                      setState(() {
                        testmethod = v!;
                      });
                    },
                    value: testmethod,
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'swab',
                        child: Text('Swab Test'),
                      ),
                      DropdownMenuItem(
                        value: 'nasal',
                        child: Text('Nasal aspirate'),
                      ),
                      DropdownMenuItem(
                        value: 'rapid',
                        child: Text('Rapid Test'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
          child: Text(
            '1. Are you exhibiting 2 or more symptoms as listed below? / Adakah anda mengalami 2 atau lebih gejala berikut? • Fever / Demam Chills/Kesejukan • Shivering (rigor) / Mergigil Body ache / Sakit badan • Headache/ Sakit kepala • Sore throat / Sakit tekak • Nausea or vomiting / Loya atau muntah Diarrhea / Cirit birit *Fatigue / Keletihan • Runny nose or nasal congestion / Selesema atau hidung sumbat',
            style: TextStyle(
                color: kprimaryColor,
                fontSize: 17.5,
                fontWeight: FontWeight.bold),
          ),
        ),
        RadioListTile<String>(
            title: const Text('Symptomatic'),
            value: 'symptomatic',
            groupValue: typegroupValue,
            onChanged: (String? val) {
              setState(() {
                typegroupValue = val!;
              });
            }),
        RadioListTile<String>(
            title: const Text('Asymptomatic'),
            value: 'asymptomatic',
            groupValue: typegroupValue,
            onChanged: (String? val) {
              setState(() {
                typegroupValue = val!;
              });
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
          child: Text(
            'Vaccinated',
            style: TextStyle(
                color: kprimaryColor,
                fontSize: 17.5,
                fontWeight: FontWeight.bold),
          ),
        ),
        RadioListTile<bool>(
            title: const Text('Yes'),
            value: true,
            groupValue: vaccinegroupValue,
            onChanged: (val) {
              setState(() {
                vaccinegroupValue = val!;
              });
            }),
        RadioListTile<bool>(
            title: const Text('No'),
            value: false,
            groupValue: vaccinegroupValue,
            onChanged: (val) {
              setState(() {
                vaccinegroupValue = val!;
              });
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
          child: Text(
            'Test Result',
            style: TextStyle(
                color: kprimaryColor,
                fontSize: 17.5,
                fontWeight: FontWeight.bold),
          ),
        ),
        RadioListTile<bool>(
            title: const Text('Positive'),
            value: true,
            groupValue: resultgroupValue,
            onChanged: (val) {
              setState(() {
                resultgroupValue = val!;
              });
            }),
        RadioListTile<bool>(
            title: const Text('Negative'),
            value: false,
            groupValue: resultgroupValue,
            onChanged: (val) {
              setState(() {
                resultgroupValue = val!;
              });
            }),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Send Report',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
              kprimaryColor,
            )),
          ),
        )
      ],
    );
  }

  @override
  initState() {
    super.initState();
    _animatedwidget = update();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(cardcolor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Covid Update',
                        style: TextStyle(
                          color: kprimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _animatedwidget = update();
                      });
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(cardcolor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Weekly Health Assessment',
                        style: TextStyle(
                          color: kprimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _animatedwidget = assessment();
                      });
                    },
                  ),
                ]),
                const SizedBox(
                  height: 15.0,
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1200),
                  child: _animatedwidget,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
