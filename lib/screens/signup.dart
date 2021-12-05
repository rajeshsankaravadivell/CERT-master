import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pert/constants/colors.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/landing_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _passwordVisible =true;


  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  Padding textfield(hinttext, controller,icon,obscuretext) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: TextFormField(
          obscureText: obscuretext,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon:icon,


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
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: const Text('Sign up'),

        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(

              children: [

                Image.asset('assets/studentloginpage/iukl_logo.png'),


                textfield('Email', email,Icon(Icons.email),false),
                textfield('Password', password,IconButton(onPressed: (){
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                }, icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),),_passwordVisible),
                textfield('Confirm Password', confirmpassword,IconButton(onPressed: (){
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                }, icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),),_passwordVisible),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () async {
                    if (email.text!=null&&confirmpassword.text
                        ==password.text){
                      await authController.auth.signUpWithEmailAndPassword(email: email.text, password: password.text).then((value) {
                        if(value!=null){
                          if(value.startsWith("uid")){
                            Get.offAll(()=>const LandingPage(),duration: const Duration(seconds: 1));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
                          }
                        } else {
                          Get.offAll(()=>const LandingPage());

                        }
                      });
                    }else{
                      final snackBar = SnackBar(
                        content: const Text('Check Your Fields',style: TextStyle(fontWeight:
                        FontWeight.bold,fontSize: 18,color: Colors.red),),
                        action: SnackBarAction(
                          label: '',

                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);


                    }

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
        ),
      ),
    );
  }
}
