import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hyperbike/onboarding/splash_screen.dart';
import 'package:hyperbike/routes/app_pages.dart';
import 'package:hyperbike/utils/theme_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      getPages: AppPages.routes,
      home: SplashScreen(),
    );
  }
}
