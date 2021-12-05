
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pert/models/assesment.dart';
import 'package:pert/models/usermodel.dart';
import 'package:pert/screens/takeAssesment.dart';

class AssessmentList extends StatefulWidget {
  const AssessmentList({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  _AssessmentListState createState() => _AssessmentListState();
}

class _AssessmentListState extends State<AssessmentList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: Assessment.getAssesments(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('Error!');
        }
        if (snapshot.hasData) {

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var assessment = Assessment.fromJson(snapshot.data!.docs[index].data());
                var Ids = widget.user.assessments!.map((e) => e.id).toList();
                return Ids.contains(assessment.id) ? Container() :
                 Card(
                  child: ListTile(
                      title: Text(assessment.title),
                      onTap: () {
                        Get.to(() => TakeAssesment(assessment: assessment));
                      }),
                );
              });

        } else
          return Center(child: CircularProgressIndicator());
      },
    );
    
  }
}
