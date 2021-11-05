// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:pert/constants/constants.dart';

FirebaseFunctions functions = FirebaseFunctions.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference<Map<String, dynamic>> admins = firestore.collection('Admins');
CollectionReference<Map<String, dynamic>> certs = firestore.collection('Certs');

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.id,
    required this.icNumber,
    required this.email,
    required this.name,
    this.photoUrl,
    this.phoneNumber,
    this.state,
    this.permanentAddress,
    this.currentAddress,
    this.pincode,
  });

  String id;
  String icNumber;
  String email;
  String name;
  String? photoUrl;
  String? state;
  String? permanentAddress;
  String? currentAddress;
  int? pincode;

  String? phoneNumber;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        state: json["state"],
        photoUrl: json["photoUrl"],
        permanentAddress: json["permanentAddress"],
        currentAddress: json["currentAddress"],
        pincode: json["pincode"],
        icNumber: json["icNumber"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "state": state,
        "photoUrl": photoUrl,
        "permanentAddress": permanentAddress,
        "currentAddress": currentAddress,
        "pincode": pincode,
        "icNumber": icNumber,
        "phoneNumber": phoneNumber,
      };
}

class SuperUser {
  SuperUser({
    required this.bioData,
    required this.uid,
    this.isAdmin = false,
    this.fcm,
  });

  Profile bioData;
  String uid;
  bool isAdmin;
  String? fcm;

  static addAdmin(Profile profile) {
    final data = {"email": profile.email, "displayName": profile.name};
    try {
      print("Triggered Add User HTTPs callables");
      return functions.httpsCallable('addAdmin').call(data).then((userRecord) {
        if (userRecord.data["errorInfo"] != null) {
          print("Returning ErrorInfo in UserRecord ");
          return userRecord.data["errorInfo"];
        } else
          return authController.auth.resetPassword(email: userRecord.data["email"]).then((value) async {
            print("Triggered User Document Creation");
            await admins.doc(userRecord.data["uid"]).set(SuperUser(bioData: profile, uid: userRecord.data["uid"], isAdmin: true).toJson());
            return {"code": "Success", "message": "User Successfully Created"};
          });
      });
    } catch (exception) {
      return exception;
    }
  }

  static addCert(Profile profile) {
    final data = {"email": profile.email, "displayName": profile.name};
    try {
      print("Triggered Add User HTTPs callables");
      return functions.httpsCallable('addCert').call(data).then((userRecord) {
        if (userRecord.data["errorInfo"] != null) {
          print("Returning ErrorInfo in UserRecord ");
          return userRecord.data["errorInfo"];
        } else
          return authController.auth.resetPassword(email: userRecord.data["email"]).then((value) async {
            print("Triggered User Document Creation");
            await certs.doc(userRecord.data["uid"]).set(SuperUser(bioData: profile, uid: userRecord.data["uid"], isAdmin: false).toJson());
            return {"code": "Success", "message": "User Successfully Created"};
          });
      });
    } catch (exception) {
      return exception;
    }
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getCertUsers(DocumentSnapshot? certUserSnapshot) {
    if (certUserSnapshot != null) {
      return certs.orderBy("id").startAfterDocument(certUserSnapshot).limit(15).get();
    } else {
      return certs.limit(15).get();
    }
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getAdminUsers(DocumentSnapshot? certUserSnapshot) {
    if (certUserSnapshot != null) {
      return admins.orderBy("id").startAfterDocument(certUserSnapshot).limit(15).get();
    } else {
      return admins.orderBy("id").limit(15).get();
    }
  }

  factory SuperUser.fromJson(Map<String, dynamic> json) =>
      SuperUser(bioData: Profile.fromJson(json["bioData"]), uid: json["uid"], isAdmin: json["isAdmin"], fcm: json["fcm"]);

  Map<String, dynamic> toJson() => {"bioData": bioData.toJson(), "uid": uid, "isAdmin": isAdmin, "fcm": fcm};
}
