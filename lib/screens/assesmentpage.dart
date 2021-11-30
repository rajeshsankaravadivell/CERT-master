import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pert/constants/colors.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/models/usermodel.dart';

class HealthAssesment extends StatefulWidget {
  const HealthAssesment({Key? key, required this.user}) : super(key: key);
  final UserModel user;
  @override
  _HealthAssesmentState createState() => _HealthAssesmentState();
}

class _HealthAssesmentState extends State<HealthAssesment> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Report Your Test Now !',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700, fontSize: 18.0),
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
            RadioListTile<bool>(
                title: const Text('Yes'),
                value: true,
                groupValue: widget.user.covidInfo!.question1,
                onChanged: (bool? val) {
                  setState(() {
                    widget.user.covidInfo!.question1 = val!;
                  });
                }),
            RadioListTile<bool>(
                title: const Text('No'),
                value: false,
                groupValue: widget.user.covidInfo!.question1,
                onChanged: (bool? val) {
                  setState(() {
                    widget.user.covidInfo!.question1 = val!;
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
                groupValue: widget.user.covidInfo!.question2,
                onChanged: (val) {
                  setState(() {
                    widget.user.covidInfo!.question2 = val!;
                  });
                }),
            RadioListTile<bool>(
                title: const Text('No'),
                value: false,
                groupValue: widget.user.covidInfo!.question2,
                onChanged: (val) {
                  setState(() {
                    widget.user.covidInfo!.question2 = val!;
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
                groupValue: widget.user.covidInfo!.question3,
                onChanged: (val) {
                  setState(() {
                    widget.user.covidInfo!.question3 = val!;
                  });
                }),
            RadioListTile<bool>(
                title: const Text('No'),
                value: false,
                groupValue: widget.user.covidInfo!.question3,
                onChanged: (val) {
                  setState(() {
                    widget.user.covidInfo!.question3 = val!;
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
                groupValue: widget.user.covidInfo!.question4,
                onChanged: (val) {
                  setState(() {
                    widget.user.covidInfo!.question4 = val!;
                  });
                }),
            RadioListTile<bool>(
                title: const Text('No'),
                value: false,
                groupValue: widget.user.covidInfo!.question4,
                onChanged: (val) {
                  setState(() {
                    widget.user.covidInfo!.question4 = val!;
                  });
                }),

          ],
        ),
      ),
    );
    ;
  }
}
