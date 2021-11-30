import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;
CollectionReference<Map<String, dynamic>> complaints = firestore.collection('Complaints');

class Complaint {
  Complaint(
      {this.attachementUrl, required this.title, required this.description, this.content, required this.documentId, this.createdDate, this.raisedBy});

  String? attachementUrl;
  String title;
  String description;
  String? content;
  String documentId;
  DateTime? createdDate;
  String? raisedBy;

  static Future<QuerySnapshot<Map<String, dynamic>>> getComplaints(DocumentSnapshot? certUserSnapshot) {
    if (certUserSnapshot != null) {
      return complaints.orderBy("bioData.id").startAfterDocument(certUserSnapshot).limit(15).get();
    } else {
      return complaints.orderBy("bioData.id").limit(15).get();
    }
  }

  static createComplaint(String? attachementUrl, String title, String description, String? content, File? file, String raisedBy) {
    if (file != null) {
      try {
        return complaints.add({
          "attachementUrl": attachementUrl,
          "title": title,
          "description": content,
          "content": content,
          "createdDate": DateTime.now(),
          "raisedBy": raisedBy
        }).then((docRef) {
          return storage.ref("complaints").child(docRef.id).putFile(file).whenComplete(() => 0);
        });
      } catch (e) {
        return e;
      }
    }
  }

  static Future<dynamic> createComplaintWithAttachment(String? attachementUrl, String title, String description, String? content, File? file, String
  raisedBy)
  async {
    if (file != null) {
      var url;
      try {
        await storage.ref("complaints").child(basename(file.path)).putFile(file).then((snapshot) async {
             url = await snapshot.ref.getDownloadURL();
        });
        return complaints.add({
          "attachementUrl": url,
          "title": title,
          "description": content,
          "content": content,
          "createdDate": DateTime.now(),
          "raisedBy": raisedBy
        });

      } catch (e) {
        return e;
      }
    }
  }

  factory Complaint.fromJson(Map<String, dynamic> json) => Complaint(
    attachementUrl: json["attachementUrl"],
    title: json["title"],
    description: json["description"],
    content: json["content"],
    documentId: json["documentID"],
    createdDate: DateTime.parse(json["createdDate"]),
  );

  Map<String, dynamic> toJson() => {
    "attachementUrl": attachementUrl,
    "title": title,
    "description": content,
    "content": content,
    "documentID": documentId,
    "createdDate": createdDate
  };
}
