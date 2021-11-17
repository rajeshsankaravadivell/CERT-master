import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pert/constants/constants.dart';
import 'package:pert/login.dart';
import 'package:pert/screens/getprofilepage.dart';
import 'package:pert/screens/home.dart';

import 'controllers/user_controller.dart';
import 'models/usermodel.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authController.auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            if (user == null) {
              return const LoginPage();
            } else {
              return StreamBuilder(
                stream: UserModel.getProfile(user.uid),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
                    if (snapshot.data.data() != null) {
                      var user = UserModel.fromJson(snapshot.data.data());
                      Get.put(UserController(user));
                      return const HomePage();
                    } else {
                      return GetProfilepage();
                    }

                  } else {
                    return const Scaffold(body: Center(child: CircularProgressIndicator()));
                  }
                },
              );
            }
          } else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
