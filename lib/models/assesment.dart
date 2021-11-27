
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pert/models/usermodel.dart';



Assessment assessmentFromJson(String str) => Assessment.fromJson(json.decode(str));

class Assessment {
  Assessment({
    required this.questions,
    required this.id,
    required this.createdDate,
    this.status = false,
  });

  List<Question> questions;
  String id;
  DateTime createdDate;
  bool status;

  static CollectionReference<Map<String, dynamic>> assessments = firestore.collection('assessments');

  CollectionReference<Map<String, dynamic>> getAssesmentCollection(String uid) {
    return firestore.collection('Users/$uid/Assessments');
  }

  factory Assessment.fromJson(Map<String, dynamic> json) => Assessment(
    questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
    id: json["id"],
    createdDate: json["createdDate"].toDate(),
  );


  Map<String, dynamic> toJsonAssessment() => {
    "questions": List<dynamic>.from(questions.map((x) => x.toJsonAssessment())),
    "id": id,
    "createdDate": createdDate,
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
      return assessments
          .doc(id.toString())
          .set(Assessment(questions: questions, id: id.toString(), createdDate: DateTime.now()).toJsonAssessment())
          .then((value) => {"code": "Success", "message": "Assessment successfully added"})
          .catchError((error) => {"code": "Failed", "message": "Sorry, Please Try again"});
    }).catchError((error) => {"code": "Failed", "message": error.toString()});
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

  submit(String uid) {
    if (canSubmit) {
      var assesmentRef = getAssesmentCollection(uid);
      assesmentRef.doc(id).set(this.toJsonAssessment()).then((value) {
        return databaseRef.child("assesmentStatus/$uid").set({"$id": true}).then((value) {
          return {"code": "Success", "message": "Assesment Submitted"};
        }).catchError((error) {
          return {"code": "Failed", "message": "Error Occured. PLease try again"};
        });
      });
    } else {
      return {"code": "Failed", "message": "Check all mandatory Fields"};
    }
  }
}

class Question {
  Question({required this.question, required this.type, this.choices, this.questionBool, this.choice, this.answer, this.mandatory = false});

  String question;
  QuestionType type;
  List<String>? choices;
  bool mandatory;
  bool? questionBool;
  int? choice;
  String? answer;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    question: json["question"],
    mandatory: json["mandatory"],
    type: QuestionType.values.elementAt(json["type"]),
    choices: json["choices"] != null ? List<String>.from(json["choices"].map((x) => x)) : null,
    questionBool: json["bool"],
    choice: json["choice"],
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "mandatory": mandatory,
    "type": QuestionType.values.indexOf(type),
    "choices": choices != null ? List<dynamic>.from(choices!.map((x) => x)) : null,
    "bool": questionBool,
    "choice": choice,
    "answer": answer,
  };

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