import 'package:get/get.dart';
import 'package:hyperbike/auth/controllers/otp_register_controller.dart';

class OtpRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpRegisterController>(
          () => OtpRegisterController(),
    );
  }
}