// import 'dart:convert';
//
// import 'package:pert/services/db.dart';
// import 'package:pert/services/functions.dart';
//
// Student quotationFromJson(String str) => Student.fromJson(json.decode(str));
//
// String quotationToJson(Student data) => json.encode(data.toJson());
//
// class Student {
//   Student({
//     required this.uid,
//     this.age,
//     required this.id,
//     required this.name,
//     required this.state,
//     this.permanentAddress,
//     this.currentAddress,
//     this.pincode,
//     required this.icNumber,
//     required this.phoneNumber,
//     this.contactHistory,
//     this.covidInfo,
//     this.quarantine,
//     required this.email,
//     this.groupId,
//     this.deviceId,
//   });
//
//   String uid;
//   int? age;
//   String id;
//   String email;
//   String name;
//   String state;
//   int? groupId;
//   int? deviceId;
//   String? permanentAddress;
//   String? currentAddress;
//   int? pincode;
//   String icNumber;
//   String? phoneNumber;
//   List<ContactHistory>? contactHistory;
//   CovidInfo? covidInfo;
//   Quarantine? quarantine;
//
//   factory Student.fromJson(Map<String, dynamic> json) => Student(
//         uid: json["uid"],
//         age: json["age"],
//         id: json["id"],
//         groupId: json["groupId"],
//         deviceId: json["deviceId"],
//         email: json["email"],
//         name: json["name"],
//         state: json["state"],
//         permanentAddress: json["permanentAddress"],
//         currentAddress: json["currentAddress"],
//         pincode: json["pincode"],
//         icNumber: json["icNumber"],
//         phoneNumber: json["phoneNumber"],
//         contactHistory:
//             json["contactHistory"] != null ? List<ContactHistory>.from(json["contactHistory"].map((x) => ContactHistory.fromJson(x))) : null,
//         covidInfo: json["covidInfo"] != null ? CovidInfo.fromJson(json["covidInfo"]) : null,
//         quarantine: json["quarantine"] != null ? Quarantine.fromJson(json["quarantine"]) : null,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "uid": uid,
//         "age": age,
//         "id": id,
//         "groupId": groupId,
//         "deviceId": deviceId,
//         "email": email,
//         "name": name,
//         "state": state,
//         "permanentAddress": permanentAddress,
//         "currentAddress": currentAddress,
//         "pincode": pincode,
//         "icNumber": icNumber,
//         "phoneNumber": phoneNumber,
//         "contactHistory": contactHistory != null ? List<dynamic>.from(contactHistory!.map((x) => x.toJson())) : null,
//         "covidInfo": covidInfo != null ? covidInfo!.toJson() : null,
//         "quarantine": quarantine != null ? quarantine!.toJson() : null,
//       };
//
//   static void addStudentRole({
//     String? id,
//     String? email,
//     String? name,
//     String? state,
//     String? permanentAddress,
//     String? currentAddress,
//     int? pincode,
//     String? phoneNumber,
//     String? icNumber,
//   }) {
//     addUser(
//         id: id!,
//         email: email!,
//         name: name!,
//         state: state!,
//         permanentAddress: permanentAddress,
//         currentAddress: currentAddress,
//         phoneNumber: phoneNumber,
//         pincode: pincode,
//         icNumber: icNumber!);
//   }
// }
//
// class ContactHistory {
//   ContactHistory({required this.contact, required this.fcm, required this.totalTimeinContact});
//
//   String contact;
//   String fcm;
//   int totalTimeinContact;
//
//   factory ContactHistory.fromJson(Map<String, dynamic> json) => ContactHistory(
//         contact: json["contact"],
//         fcm: json["fcm"],
//         totalTimeinContact: json["totalTimeinContact"],
//       );
//
//   Map<String, dynamic> toJson() => {"contact": contact, "fcm": fcm, "totalTimeinContact": totalTimeinContact};
// }
//
// class CovidInfo {
//   CovidInfo({
//     this.result = false,
//     this.method,
//     this.type,
//     this.date,
//     this.vaccinated = false,
//     this.vaccinatedOn,
//   });
//
//   bool result;
//   String? method;
//   String? type;
//   DateTime? date;
//   bool vaccinated;
//   DateTime? vaccinatedOn;
//
//   factory CovidInfo.fromJson(Map<String, dynamic> json) => CovidInfo(
//         result: json["result"],
//         method: json["method"],
//         type: json["type"],
//         date: DateTime.parse(json["date"]),
//         vaccinated: json["vaccinated"],
//         vaccinatedOn: DateTime.parse(json["vaccinatedOn"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "result": result,
//         "method": method,
//         "type": type,
//         "date": date,
//         "vaccinated": vaccinated,
//         "vaccinatedOn": vaccinatedOn,
//       };
// }
//
// class Quarantine {
//   Quarantine({
//     required this.startDate,
//     required this.endDate,
//     required this.location,
//   });
//
//   DateTime startDate;
//   DateTime endDate;
//   Location location;
//
//   factory Quarantine.fromJson(Map<String, dynamic> json) => Quarantine(
//         startDate: DateTime.parse(json["startDate"]),
//         endDate: DateTime.parse(json["endDate"]),
//         location: Location.fromJson(json["location"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "startDate": startDate.toIso8601String(),
//         "endDate": endDate.toIso8601String(),
//         "location": location.toJson(),
//       };
// }
//
// class Location {
//   Location({
//     required this.place,
//     this.floor,
//     this.block,
//   });
//
//   String place;
//   int? floor;
//   String? block;
//
//   factory Location.fromJson(Map<String, dynamic> json) => Location(
//         place: json["place"],
//         floor: json["floor"],
//         block: json["block"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "place": place,
//         "floor": floor,
//         "block": block,
//       };
// }
