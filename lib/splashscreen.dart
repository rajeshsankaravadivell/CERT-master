import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pert/landing_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  double height = 0;
  double width = 0.0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.linear);
    controller.forward();
    controller.addListener(() {
      setState(() {
        height = controller.value;
        width = controller.value;
      });
    });
    _tolandingpage();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }

  _tolandingpage() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    Get.offAll( ()=> LandingPage()

    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset('assets/studentloginpage/iukl_logo.png', opacity: CurvedAnimation(parent: controller, curve: Curves.linear)),
    );
  }
}
