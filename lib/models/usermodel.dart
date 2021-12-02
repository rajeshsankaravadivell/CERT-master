// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/models/assesment.dart';
import 'profile_model.dart';

final databaseRef = FirebaseDatabase(databaseURL: "https://kkm-beacon.asia-southeast1.firebasedatabase.app").reference();

FirebaseFunctions functions = FirebaseFunctions.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference<Map<String, dynamic>> users = firestore.collection('Users');

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.bioData,
    required this.uid,
    this.isStaff = false,
    this.device,
    this.quarantine,
    this.quarantineHistory,
    this.covidInfo,
    this.contactHistory,
    this.fcm,
    this.createdDate,
    this.assessments,
    this.covidHistory,
  });

  Profile bioData;
  String uid;
  bool isStaff;
  Device? device;
  Quarantine? quarantine;
  List<Quarantine>? quarantineHistory;
  CovidInfo? covidInfo;
  List<CovidInfo>? covidHistory;
  List<ContactHistory>? contactHistory;
  List<Assessment>? assessments;
  String? fcm;
  DateTime? createdDate;

  static addUser(Profile profile, bool staff, Device? device) {
    final data = {"email": profile.email, "displayName": profile.name};
    try {
      print("Triggered Add User HTTPs callables");
      return functions.httpsCallable('addStaff').call(data).then((userRecord) {
        if (userRecord.data["errorInfo"] != null) {
          print("Returning ErrorInfo in UserRecord ");
          return userRecord.data["errorInfo"];
        } else {
          return authController.auth.resetPassword(email: userRecord.data["email"]).then((value) async {
            print("Triggered User Document Creation");
            await users.doc(userRecord.data["uid"]).set(
                  UserModel(bioData: profile, uid: userRecord.data["uid"], createdDate: DateTime.now(), device: device).toJson(),
                );
            return {"code": "Success", "message": "User Successfully Created"};
          });
        }
      });
    } catch (exception) {
      return exception;
    }
  }

  Map<String, dynamic> toRTDBJson() => {
        "bioData": bioData.name,
        "uid": uid,
        "isStaff": isStaff,
        "deviceID": device != null ? device!.deviceId : null,
        "groupID": device != null ? device!.groupId : null,
        "quarantine": quarantine != null ? quarantine!.location.place.toString() : null,
        "isCovid": covidInfo != null ? covidInfo!.result : false,
        "fcm": fcm,
        "createdDate": createdDate != null ? createdDate!.toIso8601String() : null,
      };

  addCurrentUserDocument() {
    return users.doc(uid).set(toJson()).then((value) => print("value added"));
  }

 updateToken(String fcm) async {
    return await users.doc(uid).update({'fcm' : fcm});
 }

  loadContacts() async {
    print("Initialization started $uid");
    List<ContactHistory>? returns = [];
    var contacts = await databaseRef.child("contacts").child(uid).get().then((result) {
      return result.value ?? null;
    });
    print(contacts);
    if (contacts != null) {
      contacts.forEach((k, json) {
        print(json);
        returns.add(ContactHistory(
          contact: json["contact"],
          fcm: json["fcm"] ?? '',
          totalTimeinContact: json["totalTimeinContact"],
          groupId: json["groupId"],
          deviceId: json["deviceId"],
          gateWay: json["gateWay"],
          lastContact: DateTime.fromMillisecondsSinceEpoch(json["lastContact"] * 1000),
        ));
      });
    }
    this.contactHistory = returns;
    print(this.contactHistory.toString());
    print(returns);
    return returns;
  }

  Future<dynamic> updateUser() async {
    print("Hrllo");
    return await users.doc(uid).update(toJson()).then((value) {
      var json = toRTDBJson();
      return databaseRef.child("users").child(uid).set(json).then((value) {
        print(json["fcm"]);
        return databaseRef.child("users/$uid/fcm").set(json["fcm"]).then((value) {
          return {"code": "Success", "message": "User update successful"};
        }).catchError((error){
          return {"code": "Failure", "message": "Unknown Error. Please try again"};
        });
      }).catchError((onError) {
        return {"code": "Failure", "message": "Unknown Error. Please try again"};
      });
    });
  }

  quarantineUser(Quarantine quarantine) async {
    try {
      await users.doc(uid).update({"quarantine": quarantine.toJson()});
      return {"code": "Success", "message": "Quarantine Status Updated"};
    } catch (exception) {
      return exception;
    }
  }

  addAssessment(Assessment item) {
    assessments ??= [];
    assessments!.add(item);
    updateUser();
  }

  List<String> get searchString => makeSearchString(this.bioData.name);
  makeSearchString(String text) {
    List<String> returns = [];
    var length = text.length;
    for (int i = 0; i < length; i++) {
      returns.add(text.substring(0, i));
    }
    return returns;
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getProfile(String uid) {
    return users.doc(uid).snapshots();
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getUsers(DocumentSnapshot? certUserSnapshot) {
    if (certUserSnapshot != null) {
      return users.orderBy("bioData.id").startAfterDocument(certUserSnapshot).limit(15).get();
    } else {
      return users.orderBy("bioData.id").limit(15).get();
    }
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        bioData: Profile.fromJson(json["bioData"]),
        uid: json["uid"],
        isStaff: json["isStaff"],
        device: json["device"] != null ? Device.fromJson(json["device"]) : null,
        quarantine: json["quarantine"] != null ? Quarantine.fromJson(json["quarantine"]) : null,
        covidInfo: json["covidInfo"] != null ? CovidInfo.fromJson(json["covidInfo"]) : null,
        contactHistory:
            json["contactHistory"] != null ? List<ContactHistory>.from(json["contactHistory"].map((x) => ContactHistory.fromJson(x))) : null,
        covidHistory: json["covidHistory"] != null ? List<CovidInfo>.from(json["covidHistory"].map((x) => CovidInfo.fromJson(x))) : null,
        fcm: json["fcm"],
        createdDate: json["createdDate"] != null ? json["createdDate"].toDate() : null,
      );

  Map<String, dynamic> toJson() => {
        "bioData": bioData.toJson(),
        "uid": uid,
        "isStaff": isStaff,
        "device": device != null ? device!.toJson() : null,
        // "quarantine": quarantine != null ? quarantine!.toJson() : null,
        "covidInfo": covidInfo != null ? covidInfo!.toJson() : null,
        "contactHistory": contactHistory != null ? List<dynamic>.from(contactHistory!.map((x) => x.toJson())) : null,
        "covidHistory": covidHistory != null ? List<dynamic>.from(covidHistory!.map((x) => x.toJson())) : null,
        "fcm": fcm,
        "createdDate": createdDate,
        "search": searchString,
      };
}

class Device {
  Device({
    required this.groupId,
    required this.deviceId,
    this.dmac,
  });

  int groupId;
  int deviceId;
  String? dmac;

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        groupId: json["groupID"],
        deviceId: json["deviceID"],
        dmac: json["dmac"],
      );

  Map<String, dynamic> toJson() => {
        "groupID": groupId,
        "deviceID": deviceId,
        "dmac": dmac,
      };
}

class Quarantine {
  Quarantine({
    required this.startDate,
    required this.endDate,
    required this.location,
  });

  DateTime startDate;
  DateTime endDate;
  Location location;

  factory Quarantine.fromJson(Map<String, dynamic> json) => Quarantine(
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "location": location.toJson(),
      };
}

class Location {
  Location({required this.place, this.floor, this.block, this.inCampus = true, this.quarantineAddress, this.roomNumbmer});

  String? place;
  int? floor;
  String? block;
  String? roomNumbmer;
  bool inCampus;
  String? quarantineAddress;

  factory  Location.fromJson(Map<String, dynamic> json) => Location(
      place: json["place"],
      floor: json["floor"],
      block: json["block"],
      inCampus: json["inCampus"] ?? false,
      quarantineAddress: json["quarantineAddress"],
      roomNumbmer: json["roomNumbmer"]);

  Map<String, dynamic> toJson() => {
    "place": place,
    "floor": floor,
    "block": block,
    "inCampus": inCampus,
    "quarantineAddress": quarantineAddress,
    "roomNumbmer": roomNumbmer,
  };
}



class CovidInfo {
  CovidInfo({
    this.result = false,
    this.method,
    this.type,
    this.date,
    this.vaccinated = false,
    this.vaccinatedOn,
    this.question1 = false,
    this.question2 = false,
    this.question3 = false,
    this.question4 = false,
  });

  bool result;
  String? method;
  String? type;
  DateTime? date;
  bool vaccinated;
  DateTime? vaccinatedOn;
  bool? question1;
  bool? question2;
  bool? question3;
  bool? question4;

  factory CovidInfo.fromJson(Map<String, dynamic> json) => CovidInfo(
        result: json["result"] ?? false,
        method: json["method"],
        type: json["type"],
        date: json["date"] != null ? json["date"].toDate() : null,
        vaccinated: json["vaccinated"],
        vaccinatedOn: json["vaccinatedOn"] != null ? json["vaccinatedOn"].toDate() : null,
        question1: json["question1"] ?? false,
        question2: json["question2"] ?? false,
        question3: json["question3"] ?? false,
        question4: json["question4"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "method": method,
        "type": type,
        "date": date,
        "vaccinated": vaccinated,
        "vaccinatedOn": vaccinatedOn,
        "question1": question1,
        "question2": question2,
        "question3": question4,
        "question4": question4,
      };
}

class ContactHistory {
  ContactHistory(
      {required this.contact,
      required this.fcm,
      required this.totalTimeinContact,
      this.deviceID,
      this.groupId,
      this.gateWay,
      this.lastContact,
      this.covidStatus = false,
      deviceId});

  String contact;
  bool covidStatus;
  int? groupId;
  int? deviceID;
  String fcm;
  int totalTimeinContact;
  String? gateWay;
  DateTime? lastContact;

  factory ContactHistory.fromJson(Map<String, dynamic> json) => ContactHistory(
        contact: json["contact"],
        fcm: json["fcm"] ?? "",
        totalTimeinContact: json["totalTimeinContact"],
        groupId: json["groupId"],
        deviceID: json["deviceID"],
        gateWay: json["gateWay"],
        lastContact: DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "contact": contact,
        "fcm": fcm,
        "totalTimeinContact": totalTimeinContact,
        "deviceId": deviceID,
        "groupId": groupId,
        "gateWay": gateWay,
        "lastContact": lastContact,
      };

  static getDummyContacts() {
    return [
      ContactHistory(contact: "user1", fcm: "fcm", totalTimeinContact: 50, deviceID: 1001, groupId: 1000),
      ContactHistory(contact: "user2", fcm: "fcm", totalTimeinContact: 15, deviceID: 2001, groupId: 2000),
      ContactHistory(contact: "user3", fcm: "fcm", totalTimeinContact: 10, deviceID: 3001, groupId: 3000),
    ];
  }
}
