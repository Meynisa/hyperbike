import 'package:get/get.dart';
import 'package:hyperbike/auth/controllers/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
          () => ForgotPasswordController(),
    );
  }
}