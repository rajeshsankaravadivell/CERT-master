import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pert/screens/covidupdate.dart';
import 'package:pert/screens/test.dart';
import 'package:pert/widgets/covidstatus_tab.dart';

import 'covidstatus.dart';

enum SingingCharacter { CovidUpdate, Healthassessment, CovidStatus }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget> with TickerProviderStateMixin {
  late TabController _tabController;
  SingingCharacter? _character = SingingCharacter.CovidStatus;
  String? _title = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 10,
        title: Text(
          _title!,
          style: TextStyle(color: Colors.black),
        ),

        bottom: TabBar(

          controller: _tabController,
          tabs: <Widget>[
            Tab( icon: Icon(Icons.update)),


            Tab( icon: Icon(Icons.health_and_safety_rounded)),
            Tab(icon: Icon(Icons.list_alt)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(child: CovidUpdate()),
          Center(
            child: HealthAssesment(),
          ),
          Center(
            child: CovidStatusTab(),
          ),
        ],
      ),
    );
  }
}
