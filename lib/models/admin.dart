// // To parse this JSON data, do
// //
// //     final admin = adminFromJson(jsonString);
//
// import 'dart:convert';
// import 'package:pert/services/functions.dart';
//
// Admin adminFromJson(String str) => Admin.fromJson(json.decode(str));
//
// String adminToJson(Admin data) => json.encode(data.toJson());
//
// class Admin {
//   Admin({
//     required this.uid,
//     required this.id,
//     required this.email,
//     required this.name,
//     required this.state,
//     this.permanentAddress,
//     this.currentAddress,
//     this.pincode,
//     required this.icNumber,
//     this.phoneNumber,
//   });
//
//   String uid;
//   String id;
//   String email;
//   String name;
//   String state;
//   String? permanentAddress;
//   String? currentAddress;
//   int? pincode;
//   String icNumber;
//   String? phoneNumber;
//
//   factory Admin.fromJson(Map<String, dynamic> json) => Admin(
//         uid: json["uid"],
//         id: json["id"],
//         name: json["name"],
//         state: json["state"],
//         permanentAddress: json["permanentAddress"],
//         currentAddress: json["currentAddress"],
//         pincode: json["pincode"],
//         icNumber: json["icNumber"],
//         phoneNumber: json["phoneNumber"],
//         email: json["email"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "uid": uid,
//         "id": id,
//         "email": email,
//         "name": name,
//         "state": state,
//         "permanentAddress": permanentAddress,
//         "currentAddress": currentAddress,
//         "pincode": pincode,
//         "icNumber": icNumber,
//         "phoneNumber": phoneNumber,
//       };
//
//   static addAdminRole(
//       {required String id,
//       required String email,
//       required String name,
//       required String state,
//       String? permanentAddress,
//       String? currentAddress,
//       int? pincode,
//       required String icNumber,
//       String? phoneNumber}) async {
//     await addAdmin(
//         email: email,
//         name: name,
//         state: state,
//         permanentAddress: permanentAddress,
//         currentAddress: currentAddress,
//         phoneNumber: phoneNumber,
//         pincode: pincode,
//         icNumber: icNumber,
//         id: id);
//   }
//
//   static addCertRole({required String email}) async {
//     await addCert(email: email);
//   }
// }
