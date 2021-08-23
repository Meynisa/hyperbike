import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:hyperbike/routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  _SplashScreenState() {
    timer = new Timer(const Duration(seconds: 3), () async {
      Get.offNamed(AppPages.ONBOARDING);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(80),
          child: Image.asset('assets/images/img_bg.png'),
        ),
      ),
    );
  }
}
