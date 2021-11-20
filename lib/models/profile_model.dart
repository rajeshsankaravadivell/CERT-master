// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pert/constants/constants.dart';
import 'package:path/path.dart';

FirebaseFunctions functions = FirebaseFunctions.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;
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
    required this.phoneNumber,
    required this.houseAddress,
    this.residenceAddress,
    this.imageUrl,
    required this.department,
    required this.passportNumber,
    this.isLocal = true,
  });

  String id;
  String icNumber;
  String passportNumber;
  String email;
  String name;
  String department;
  String? houseAddress;
  String? residenceAddress;
  String? imageUrl;
  String? phoneNumber;
  bool isLocal;

  static Future<dynamic> uploadPhoto() async {
    String? url;
    try {
      var xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (xfile != null) {
        var filePath = xfile.path;
        var file = File(filePath);
        await storage.ref("profiles").child(basename(file.path)).putFile(file).then((snapshot) async {
          url = await snapshot.ref.getDownloadURL();
        });
      }
      return url;
    } catch (e) {
      return e;
    }
  }

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        houseAddress: json["permanentAddress"],
        residenceAddress: json["currentAddress"],
        icNumber: json["icNumber"],
        phoneNumber: json["phoneNumber"],
        imageUrl: json["imageUrl"],
        passportNumber: json["passportNumber"],
        department: json["department"],
        isLocal: json["isLocal"] ?? true,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "permanentAddress": houseAddress,
        "currentAddress": residenceAddress,
        "icNumber": icNumber,
        "phoneNumber": phoneNumber,
        "imageUrl": imageUrl,
        "department" : department,
        "passportNumber" :passportNumber,
        "local" : isLocal,
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
        } else {
          return authController.auth.resetPassword(email: userRecord.data["email"]).then((value) async {
            print("Triggered User Document Creation");
            await admins.doc(userRecord.data["uid"]).set(SuperUser(bioData: profile, uid: userRecord.data["uid"], isAdmin: true).toJson());
            return {"code": "Success", "message": "User Successfully Created"};
          });
        }
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
        } else {
          return authController.auth.resetPassword(email: userRecord.data["email"]).then((value) async {
            print("Triggered User Document Creation");
            await certs.doc(userRecord.data["uid"]).set(SuperUser(bioData: profile, uid: userRecord.data["uid"], isAdmin: false).toJson());
            return {"code": "Success", "message": "User Successfully Created"};
          });
        }
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
