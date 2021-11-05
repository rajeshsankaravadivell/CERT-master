import 'dart:convert';

import 'package:flutter/material.dart';
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
      children:  [
        Text('Covid Status',style: Theme.of(context).textTheme.headline5),
        CustomTile(),
      ],
    );
  }
}
