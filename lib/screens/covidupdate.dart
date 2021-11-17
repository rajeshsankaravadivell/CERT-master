import 'package:flutter/material.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/models/usermodel.dart';

enum SingingCharacter { Yes, No }

class CovidUpdate extends StatefulWidget {
  const CovidUpdate({Key? key}) : super(key: key);

  @override
  State<CovidUpdate> createState() => _CovidUpdateState();
}

class _CovidUpdateState extends State<CovidUpdate> {
  @override
  void initState() {
    // TODO: implement initState
    userController.user.covidInfo ??= CovidInfo(
      question1: null,
      question2: null,
      question3: null,
      question4: null,
      result: false,
      vaccinated: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Test Result',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700, fontSize: 18.0),
          ),
        ),
        ListTile(
          title: const Text('Yes'),
          leading: Radio<bool>(
            value: true,
            groupValue: userController.user.covidInfo!.result,
            onChanged: (bool? value) {
              setState(() {
                userController.user.covidInfo!.result = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No'),
          leading: Radio<bool>(
            value: false,
            groupValue: userController.user.covidInfo!.result,
            onChanged: (bool? value) {
              setState(() {
                userController.user.covidInfo!.result = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
