import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pert/models/usermodel.dart';
import 'package:pert/screens/assesmentList.dart';
import 'package:pert/screens/covidupdate.dart';
import 'package:pert/screens/assesmentpage.dart';
import 'package:pert/widgets/covidstatus_tab.dart';

import 'covidstatus.dart';

enum SingingCharacter { CovidUpdate, Healthassessment, CovidStatus }

class covidstatus extends StatefulWidget {
  const covidstatus({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  State<covidstatus> createState() => _covidstatusState();
}

/// This is the private State class that goes with MyStatefulWidget.
/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _covidstatusState extends State<covidstatus> with TickerProviderStateMixin {
  late TabController _tabController;
  SingingCharacter? _character = SingingCharacter.CovidStatus;
  String? _title = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // toolbarHeight: 10,
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'Covid Status',
            style: TextStyle(color: Colors.black),
          ),
        ),

        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(icon: Icon(Icons.update)),
            Tab(icon: Icon(Icons.health_and_safety_rounded)),
            Tab(icon: Icon(Icons.list_alt)),
            Tab(icon: Icon(Icons.list)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(child: CovidUpdate(user: widget.user)),
          Center(child: HealthAssesment(user: widget.user)),
          Center(child: CovidStatusTab(user: widget.user)),
          Center(child: AssessmentList(user: widget.user)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget.user.covidInfo!.date = DateTime.now();
            widget.user.covidHistory ??= [];
            if (widget.user.covidHistory!.isEmpty) {
              widget.user.covidHistory!.add(widget.user.covidInfo!);
            } else {
              var days = widget.user.covidHistory!.last.date!.difference(widget.user.covidInfo!.date!).inDays;
              if (days >= -1 && days <= 1) {
                // widget.user.covidHistory!.add(widget.user.covidInfo!);
              } else {
                widget.user.covidHistory!.add(widget.user.covidInfo!);
              }
            }
            widget.user.updateUser().then((value) {
              print(value.toString());
              try {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          value["code"].toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                        content: Text(value["message"].toString()),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Okay"))
                        ],
                      );
                    });
              } catch (ex) {}
            });
          },
          child: const Icon(Icons.save)),
    );
  }
}
