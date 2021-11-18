// import 'package:cloud_functions/cloud_functions.dart';
// import 'package:pert/constants/constants.dart';
// import 'package:pert/models/admin.dart';
// import 'package:pert/models/user.dart';
// import 'package:pert/services/db.dart';
//
// FirebaseFunctions functions = FirebaseFunctions.instance;
//
// Future<void> addAdmin(
//     {required String id,
//     required String email,
//     required String name,
//     required String state,
//     String? permanentAddress,
//     String? currentAddress,
//     int? pincode,
//     required String icNumber,
//     String? phoneNumber}) async {
//   final data = {
//     "email": email,
//     "displayName": name,
//   };
//   var userRecord = await functions.httpsCallable('addAdmin').call(data);
//   await authController.auth.resetPassword(email: userRecord.data["email"]);
//   addCertUser(Admin(
//       uid: userRecord.data["uid"] != null ? userRecord.data["uid"] : null,
//       id: id,
//       email: email,
//       name: name,
//       state: state,
//       permanentAddress: permanentAddress,
//       currentAddress: currentAddress,
//       pincode: pincode,
//       icNumber: icNumber,
//       phoneNumber: phoneNumber));
//   // print(userRecord.data["email"]);
// }
//
// addUser(
//     {required String id,
//     required String email,
//     required String name,
//     required String state,
//     String? permanentAddress,
//     String? currentAddress,
//     int? pincode,
//     required String icNumber,
//     String? phoneNumber}) async {
//   final data = {
//     "email": email,
//     "displayName": name,
//   };
//   var userRecord = await functions.httpsCallable('addStaff').call(data);
//
//   if (userRecord.data["errorInfo"] != null) {
//     return userRecord.data["errorInfo"];
//   }
//   await authController.auth.resetPassword(email: userRecord.data["email"]);
//
// Future<void> addCert({required String email}) async {
//   final data = {email: email};
//   await functions.httpsCallable('addCert').call(data).then((value) => print("Cert added")).catchError((onError) {
//     print(onError);
//   });
// }
