import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hyperbike/onboarding/onboarding_info.dart';
import 'package:get/utils.dart';
import 'package:get/state_manager.dart';

class OnboardingController extends GetxController {
  var pageController = PageController();
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;

  forwardAction() {
    if (isLastPage) {
      //go to home page
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/onboarding_1.png', 'Who We Are',
        'We are “hyperlocal” biker for every house hold need'),
    OnboardingInfo('assets/images/onboarding_2.png', 'Our Vision',
        'To be a reliable partner for hyperlocal communities by developing an  ecosystem through our technology'),
    OnboardingInfo('assets/images/onboarding_3.png', 'How We Work',
        'Our partner to our Hyperhub in every RT&RW to every households'),
  ];
}
