import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference<Map<String, dynamic>> announcements = firestore.collection('Announcements');

class Announcement {
  Announcement({
    this.attachementUrl,
    required this.title,
    required this.description,
    this.content,
    required this.documentId,
    this.createdDate,
  });

  String? attachementUrl;
  String title;
  String description;
  String? content;
  late String documentId;
  DateTime? createdDate;

  static createAnnouncement({
    String? attachementUrl,
    required String title,
    required String description,
    String? content,
  }) {
    announcements
        .add({"attachementUrl": attachementUrl, "title": title, "description": description, "content": content, "createdDate": DateTime.now()});
  }

  factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
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
        "description": description,
        "content": content,
        "documentID": documentId,
        "createdDate": createdDate
      };
}
