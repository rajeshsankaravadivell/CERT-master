import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pert/models/admin.dart';
import 'package:pert/models/user.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference<Map<String, dynamic>> users = firestore.collection('Users');
CollectionReference<Map<String, dynamic>> certs = firestore.collection('Certs');
CollectionReference<Map<String, dynamic>> complaints = firestore.collection('Complaints');
CollectionReference<Map<String, dynamic>> assesments = firestore.collection('Assesments');


Stream<QuerySnapshot<Map<String, dynamic>>>? getPeople() {
  var collectionStream = users.snapshots();
  return collectionStream;
}

Stream<DocumentSnapshot<Map<String, dynamic>>> getProfile(String uid) {
  return users.doc(uid).snapshots();
}

addCertUser(Admin cert) {
  certs.doc(cert.uid).set(cert.toJson()).then((value) => print("User Added"));
}

addStudentUser(Student user) async {
  try {
    await users.doc(user.uid).set(user.toJson()).then((value) => print("User Added"));
  } catch (exception) {
    return "failed";
  }
  return 0;
}

Future<QuerySnapshot<Map<String, dynamic>>> getCertUsers(DocumentSnapshot? certUserSnapshot) {
  if (certUserSnapshot != null) {
    return certs.orderBy("id").startAfterDocument(certUserSnapshot).limit(15).get();
  } else {
    return certs.orderBy("id").limit(15).get();
  }
}

Future<QuerySnapshot<Map<String, dynamic>>> getUsers(DocumentSnapshot? userSnapshot) async {
  if (userSnapshot != null) {
    return users.orderBy("id").startAfterDocument(userSnapshot).limit(15).get();
  } else {
    return await users.orderBy("id").limit(5).get();
  }
}
