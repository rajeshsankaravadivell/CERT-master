import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference<Map<String, dynamic>> globalData = firestore.collection('GlobalData');

class GlobalData {
  static int totalStudents = 0;
  static int totalStaffs = 0;
  static int totalAssesments = 0;
  static int totalAnnouncements = 0;
  static int totalComplaints = 0;
  static int totalCerts = 0;
  static int totalCovidPositives = 0;
  static int totalQuarantine = 0;

  static loadData() async {
    var data = await globalData.doc("counters").get().then((value) => value.data());
    totalStudents = data!["totalStudents"];
    totalStaffs = data["totalStaffs"];
    totalAssesments = data["totalAssesments"];
    totalAnnouncements = data["totalAnnouncements"];
    totalComplaints = data["totalComplaints"];
    totalCerts = data["totalCerts"];
    totalCovidPositives = data["totalCovidPositives"];
    totalQuarantine = data["totalQuarantine"];
  }
}
