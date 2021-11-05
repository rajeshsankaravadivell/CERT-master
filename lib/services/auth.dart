import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_functions/cloud_functions.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:pert/screens/forgetpassword.dart';
// import 'package:provider/provider.dart';

class AuthenticationService extends ChangeNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final FirebaseFunctions functions = FirebaseFunctions.instance;

  static String _uid = '';

  set uid(text) => {_uid = text};

  String get uid => _uid;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();
  User? get currentUser => _firebaseAuth.currentUser;
  get claims => this.currentUser!.getIdTokenResult(true).then((value) => value.claims);
  Future<String> signUpWithEmailAndPassword({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return "error Unknown";
  }

  Future<String> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return "error" + e.code;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return "error" + e.code;
      }
    }
    return "error Unknown";
  }

  Future<void> resetPassword({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async {
    _firebaseAuth.signOut();
  }
}
