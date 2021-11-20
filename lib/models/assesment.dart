import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

CollectionReference<Map<String, dynamic>> users = FirebaseFirestore.instance.collection('assesments');
final database = FirebaseDatabase.instance.reference().child("globalData/assesments");

Assessment assesmentFromJson(String str) => Assessment.fromJson(json.decode(str));

String assesmentToJson(Assessment data) => json.encode(data.toJson());

class Assessment {
  Assessment({
    required this.id,
    required this.questions,
  });

  String id;
  List<Question> questions;

  factory Assessment.fromJson(Map<String, dynamic> json) => Assessment(
    id: json["id"],
    questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
  };



  static Future<dynamic> get nextId async {
    // return database.set(ServerValue.increment(1)).then((value) => print("object"));
    return database.runTransaction((mutableData) {
      mutableData.value = (mutableData.value + 1);
      return mutableData;
    }).then((result) {
      // print(result.committed);
      if (result.dataSnapshot!.exists) {
        return result.dataSnapshot!.value;
      } else {
        return 0;
      }
    }).catchError((error) => 0);
  }
}

class Question {
  Question({
    required this.question,
    required this.type,
    this.choices,
    this.boolean,
    this.choice
  });

  String question;
  int type;
  List<String>? choices;
  bool? boolean;
  int? choice;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    question: json["question"],
    type: json["type"],
    choices: json["choices"] != null ? List<String>.from(json["choices"].map((x) => x)) : null,
    boolean: json["boolean"],
    choice: json["choice"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "type": type,
    "choices": choices != null ? List<dynamic>.from(choices!.map((x) => x)) : null,
    "boolean": boolean,
    "choice": choice,
  };
}