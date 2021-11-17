import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pert/constants/colors.dart';
import 'package:pert/screens/home.dart';
import 'package:pert/screens/signup.dart';

import 'constants/constants.dart';
import 'landing_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.10,
              left: 0,
              child: Image.asset(
                'assets/studentloginpage/iukl_logo.png',
                height: MediaQuery.of(context).size.height * 0.15,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 10,
              child: Image.asset(
                'assets/studentloginpage/manleft.png',
                height: MediaQuery.of(context).size.height * 0.365,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 5,
              child: Image.asset(
                'assets/studentloginpage/manright.png',
                height: MediaQuery.of(context).size.height * 0.38,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textfield('Email', name),
                textfield('Password', password),
                const SizedBox(
                  height: 15.0,
                ),
                InkWell(
                  onTap: () async {
                    await authController.auth.signInWithEmailAndPassword(email: name.text, password: password.text).then((value){
                      if(value!=null){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
                      }
                      Get.to(()=>const LandingPage());
                    });
                    // if(result) {

                    // }
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
                        padding: EdgeInsets.symmetric(horizontal: 56.0, vertical: 12.0),
                        child: Text(
                          'Login',
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
                const SizedBox(
                  height: 15.0,
                ),
                InkWell(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        var controller = TextEditingController();
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                autofocus: true,
                                controller: controller,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                'Please Enter your email',
                                style: TextStyle(
                                  color: kprimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              InkWell(
                                onTap: () {
                                  authController.auth.resetPassword(email: controller.text);
                                  Navigator.of(context).pop();
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("Success"),
                                          content: const Text("An email will be sent if registered"),
                                          actions: [
                                            TextButton(onPressed: (){
                                              Navigator.of(context).pop();
                                            }, child: const Text("Okay"))
                                          ],
                                        );
                                      });
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
                                      padding: EdgeInsets.symmetric(horizontal: 56.0, vertical: 12.0),
                                      child: Text(
                                        'Send',
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
                        );
                      }),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: kprimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  ),
                  child: Text(
                    'Signup',
                    style: TextStyle(
                      color: kprimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

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
}
