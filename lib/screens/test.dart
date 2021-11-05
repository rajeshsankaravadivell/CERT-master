import 'package:flutter/material.dart';
import 'package:pert/constants/colors.dart';

class HealthAssesment extends StatefulWidget {
  const HealthAssesment({Key? key}) : super(key: key);

  @override
  _HealthAssesmentState createState() => _HealthAssesmentState();
}

class _HealthAssesmentState extends State<HealthAssesment> {
  String testmethod = 'swab';
  String typegroupValue = '';
  bool vaccinegroupValue = false;
  bool resultgroupValue = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
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
            const SizedBox(
              height: 15.0,
            ),
            Text(
              'Report Your Test Now !',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700, fontSize: 18.0),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
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
                '1. Are you exhibiting 2 or more symptoms as listed below? / Adakah anda mengalami 2 atau lebih \n\n gejala berikut? • Fever / Demam '
                    'Chills/Kesejukan '
                    '• '
                    'Shivering (rigor) / Mergigil\n\n Body ache / Sakit badan • Headache/ Sakit kepala \n\n • Sore throat / Sakit tekak '
                    '• Nausea or vomiting / Loya atau muntah Diarrhea / Cirit birit *Fatigue / Keletihan\n\n'
                    ' • Runny nose or nasal congestion / Selesema atau hidung sumbat',
                style: TextStyle(color: kprimaryColor, fontSize: 17.5, fontWeight: FontWeight.bold),
              ),
            ),
            RadioListTile<String>(
                title: const Text('Yes'),
                value: 'Yes',
                groupValue: typegroupValue,
                onChanged: (String? val) {
                  setState(() {
                    typegroupValue = val!;
                  });
                }),
            RadioListTile<String>(
                title: const Text('No'),
                value: 'NO',
                groupValue: typegroupValue,
                onChanged: (String? val) {
                  setState(() {
                    typegroupValue = val!;
                  });
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
              child: Text(
                '2. Besides the above, are you exhibiting any of the symptoms listed below?/Selain yang diatas, adakah anda mengalami gejala '
                    'seperti yang berikut? *\n\n'
                    ' . Cough/Batuk • Difficulty breathing / Sesak Nafas • Loss of smell / Hilang deria bau Loss of taste / Hilang deria rasa',
                style: TextStyle(color: kprimaryColor, fontSize: 17.5, fontWeight: FontWeight.bold),
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
                '3. Have you attended any event / areas associated with known COVID-19 cluster? / Adakah anda mengunjungi lokasi berkaitan kluster COVID-19? *',
                style: TextStyle(color: kprimaryColor, fontSize: 17.5, fontWeight: FontWeight.bold),
              ),
            ),
            RadioListTile<bool>(
                title: const Text('Yes'),
                value: true,
                groupValue: resultgroupValue,
                onChanged: (val) {
                  setState(() {
                    resultgroupValue = val!;
                  });
                }),
            RadioListTile<bool>(
                title: const Text('No'),
                value: false,
                groupValue: resultgroupValue,
                onChanged: (val) {
                  setState(() {
                    resultgroupValue = val!;
                  });
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
              child: Text(
                '4. Have you travelled to any country outside Malaysia within 14 days before onset of symptoms? / '
                    'Adakah anda berkunjung ke luar negara dalam tempoh 14 hari yang lepas?*',
                style: TextStyle(color: kprimaryColor, fontSize: 17.5, fontWeight: FontWeight.bold),
              ),
            ),
            RadioListTile<bool>(
                title: const Text('Yes'),
                value: true,
                groupValue: resultgroupValue,
                onChanged: (val) {
                  setState(() {
                    resultgroupValue = val!;
                  });
                }),
            RadioListTile<bool>(
                title: const Text('No'),
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
        ),
      ),
    );
    ;
  }
}
