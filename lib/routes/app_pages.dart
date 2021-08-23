import 'package:get/get.dart';
import 'package:hyperbike/auth/bindings/forgot_password_binding.dart';
import 'package:hyperbike/auth/bindings/login_binding.dart';
import 'package:hyperbike/auth/bindings/otp_register_binding.dart';
import 'package:hyperbike/auth/bindings/register_binding.dart';
import 'package:hyperbike/auth/forgot_password_page.dart';
import 'package:hyperbike/auth/login_page.dart';
import 'package:hyperbike/auth/otp_register_page.dart';
import 'package:hyperbike/auth/register_page.dart';
import 'package:hyperbike/onboarding/onboarding_page.dart';
import 'package:hyperbike/onboarding/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH_SCREEN;
  static const ONBOARDING = Routes.ONBOARDING;
  static const LOGIN = Routes.LOGIN;
  static const FORGOT_PASSWORD = Routes.FORGOT_PASSWORD;
  static const REGISTER = Routes.REGISTER;
  static const OTP_REGISTER = Routes.OTP_REGISTER;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingPage(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.OTP_REGISTER,
      page: () => OtpRegisterPage(),
      binding: OtpRegisterBinding(),
    ),
  ];
}
