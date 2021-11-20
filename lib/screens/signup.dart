import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pert/constants/colors.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/landing_page.dart';
import 'package:pert/screens/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Padding textfield(hinttext, controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: hinttext,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Sign up'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: bgcolor,
                size: 35,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            textfield('Email', email),
            textfield('Password', password),
            const SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () async {
                await authController.auth.signUpWithEmailAndPassword(email: email.text, password: password.text).then((value) {
                  if(value!=null){
                    if(value.startsWith("uid")){
                      Get.to(()=>const LandingPage(),duration: const Duration(seconds: 2));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
                    }
                  } else {
                    Get.to(()=>const LandingPage());

                  }
                });
                // Get.to(()=>const LandingPage(),duration: const Duration(seconds: 2));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13.0),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 8.0,
                      ),
                    ],
                    color: kprimaryColor,
                    // border:Border(),
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 56.0, vertical: 12.0),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
