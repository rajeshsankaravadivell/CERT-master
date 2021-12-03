
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pert/models/usermodel.dart';
import 'package:pert/services/db.dart';
FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference<Map<String, dynamic>> users = firestore.collection('Users');


Assessment assessmentFromJson(String str) => Assessment.fromJson(json.decode(str));

class Assessment {
  Assessment({
    required this.questions,
    required this.id,
    required this.createdDate,
    this.status = false,
    this.title = '',
  });

  List<Question> questions;
  String id;
  DateTime createdDate;
  bool status;
  String title;

  CollectionReference<Map<String, dynamic>> getAssesmentCollection(String uid) {
    return firestore.collection('Users/$uid/Assessments');
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAssesments() {
    return firestore.collection("Assessments").orderBy("createdDate", descending: true).snapshots();
  }

  factory Assessment.fromJson(Map<String, dynamic> json) => Assessment(
    questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
    id: json["id"],
    createdDate: json["createdDate"].toDate(),
    title: json["title"] ?? '',
  );


  Map<String, dynamic> toJsonAssessment() => {
    "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
    "id": id,
    "createdDate": createdDate,
    "title" : title,
  };

  Map<String, dynamic> toJson() => {
    "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
    "id": id,
    "createdDate": createdDate,
  };

  Map<String, dynamic> toJsonRTDB() => {
    "id": id,
    "createdDate": createdDate,
    "status": status,
  };

  int get totalQuestions => this.questions.length;

  static addAssesment(List<Question> questions) {
    int id = 0;
    return databaseRef.child("globalData/assesments").runTransaction((mutableData) {
      id = (mutableData.value != null) ? mutableData.value++ : 0;
      return mutableData;
    }).then((value) async {
      return assesments
          .doc(id.toString())
          .set(Assessment(questions: questions, id: id.toString(), createdDate: DateTime.now()).toJsonAssessment())
          .then((value) => {"code": "Success", "message": "Assessment successfully added"})
          .catchError((error) => {"code": "Failed", "message": "Sorry, Please Try again"});
    }).catchError((error) => {"code": "Failed", "message": error.toString()});
  }
  
  static getMyAssesments(String uid) async {
    return await users.doc(uid).collection("Assessments").get().then((snapshot){
      List<Assessment> assessments= [];
      snapshot.docs.forEach((docSnap) {
        if(docSnap.exists) {
          return assessments.add(Assessment.fromJson(docSnap.data()));
        }
      });
      print(assessments.length);
      return assessments;
    });
  }
  
  bool get canSubmit {
    bool status = true;
    for (Question question in this.questions) {
      if (!question.isGoodToSubmit) {
        status = false;
        return status;
      }
    }
    return status;
  }

  Future<Map<String,dynamic>> submit(String uid) async {
    var assessmentRef = getAssesmentCollection(uid);
    return assessmentRef.doc(id).set(this.toJsonAssessment()).then((value) {
      return databaseRef.child("assessmentStatus/$id").child(uid).set(true).then((value) {
        return {"code": "Success", "message": "Assessment Submitted"};
      }).catchError((error) {
        return {"code": "Failed", "message": "Error Occurred. PLease try again"};
      });
    });
  }
}

class Question {
  Question({required this.question, required this.type, this.choices, this.questionBool, this.choice, this.answer, this.mandatory = false});

  String question;
  QuestionType type;
  List<String>? choices;
  bool mandatory ;
  bool? questionBool;
  int? choice;
  String? answer;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    question: json["question"],
    mandatory: json["mandatory"] ?? false,
    type: QuestionType.values.elementAt(json["type"]),
    choices: json["choices"] != null ? List<String>.from(json["choices"].map((x) => x)) : null,
    questionBool: json["bool"],
    choice: json["choice"],
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() {
    switch (type) {
      case QuestionType.mcq:
        return {
          "question": question,
          "mandatory": mandatory,
          "type": QuestionType.values.indexOf(type),
          "choices": choices != null ? List<dynamic>.from(choices!.map((x) => x)) : null,
          // "bool": questionBool,
          "choice": choice,
          // "answer": answer,
        };
      case QuestionType.boolean:
        return {
          "question": question,
          "mandatory": mandatory,
          "type": QuestionType.values.indexOf(type),
          // "choices": choices != null ? List<dynamic>.from(choices!.map((x) => x)) : null,
          "bool": questionBool,
          // "choice": choice,
          // "answer": answer,
        };
      case QuestionType.typed:
        return {
          "question": question,
          "mandatory": mandatory,
          "type": QuestionType.values.indexOf(type),
          // "choices": choices != null ? List<dynamic>.from(choices!.map((x) => x)) : null,
          // "bool": questionBool,
          // "choice": choice,
          "answer": answer,
        };
      default:
        return {
          "question": question,
          "mandatory": mandatory,
          "type": QuestionType.values.indexOf(type),
          "choices": choices != null ? List<dynamic>.from(choices!.map((x) => x)) : null,
          "bool": questionBool,
          "choice": choice,
          "answer": answer,
        };
    }
  }

  Map<String, dynamic> toJsonAssessment() => {
    "question": question,
    "type": QuestionType.values.indexOf(type),
    "choices": choices != null ? List<dynamic>.from(choices!.map((x) => x)) : null,
  };

  bool get isAnswered => answer == null ? false : true;

  bool get isGoodToSubmit {
    if (!mandatory) {
      return true;
    } else if (isAnswered) {
      return true;
    } else
      return false;
  }
}

enum QuestionType { mcq, boolean, typed }