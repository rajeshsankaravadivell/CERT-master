import 'package:flutter/material.dart';



enum SingingCharacter { Yes, No}

class CovidUpdate extends StatefulWidget {
  const CovidUpdate({Key? key}) : super(key: key);

  @override
  State<CovidUpdate> createState() => _CovidUpdateState();
}

class _CovidUpdateState extends State<CovidUpdate> {
  SingingCharacter? _character = SingingCharacter.No;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Test Result',style: Theme.of(context).textTheme.bodyText1),
        ),
        ListTile(
          title: const Text('Yes'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Yes,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.No,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
