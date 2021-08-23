import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyperbike/auth/login_page.dart';
import 'package:hyperbike/onboarding/onboarding_controller.dart';
import 'package:hyperbike/routes/app_pages.dart';
import 'package:hyperbike/utils/constant_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatelessWidget {
  final _getController = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {
                          // Get.toNamed(AppPages.LOGIN);
                          Get.offNamed(AppPages.LOGIN);
                        },
                        child: Text(
                          'Lewati',
                          style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ConstantsUtil.cIndigo),
                        ))),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: PageView(
                    onPageChanged: _getController.selectedPageIndex,
                    controller: _getController.pageController,
                    children: List.generate(
                        _getController.onboardingPages.length,
                        (index) => Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    _getController
                                        .onboardingPages[index].imageAssets,
                                    height:
                                        (MediaQuery.of(context).size.height /
                                            3),
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(height: 26),
                                  Text(
                                      _getController
                                          .onboardingPages[index].title,
                                      style: GoogleFonts.rubik(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: ConstantsUtil.cIndigo)),
                                  SizedBox(height: 10),
                                  Text(
                                      _getController
                                          .onboardingPages[index].description,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(
                                              150, 150, 150, 1))),
                                ],
                              ),
                            )),
                  ),
                ),
                Container(
                  child: SmoothPageIndicator(
                    controller: _getController.pageController,
                    count: _getController.onboardingPages.length,
                    effect: ExpandingDotsEffect(
                        dotColor: Color.fromRGBO(208, 208, 208, 1),
                        activeDotColor: ConstantsUtil.cIndigo,
                        dotWidth: 8,
                        dotHeight: 8,
                        spacing: 10),
                  ),
                ),
                SizedBox(height: 16),
                Stack(
                  children: [
                    Container(
                      height: 94,
                      width: 94,
                      child: Obx(() {
                        return CircularProgressIndicator(
                          strokeWidth: 3,
                          color: ConstantsUtil.cIndigo,
                          backgroundColor: Color.fromRGBO(196, 196, 196, 1),
                          value:
                              (_getController.selectedPageIndex.value + 1) / 3,
                        );
                      }),
                    ),
                    Positioned(
                      left: 7,
                      top: 7,
                      child: Container(
                        height: 80,
                        width: 80,
                        child: MaterialButton(
                            onPressed: _getController.forwardAction,
                            padding: EdgeInsets.all(8),
                            height: 80,
                            shape: CircleBorder(),
                            color: ConstantsUtil.cIndigo,
                            child: Image.asset(
                              'assets/icons/ic_scooter.png',
                              fit: BoxFit.fitHeight,
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
