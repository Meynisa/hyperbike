import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hyperbike/routes/app_pages.dart';

class OtpRegisterController extends GetxController{
  final GlobalKey<FormState> otpRegisterFormKey = GlobalKey<FormState>();

  late TextEditingController firstController, secondController, thirdController, fourthController;
  var first = '', second = '', third = '', fourth;

  @override
  void onInit() {
    super.onInit();
    firstController = TextEditingController();
    secondController = TextEditingController();
    thirdController = TextEditingController();
    fourthController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
  }

  String? validateNumber(String value) {
    if (!GetUtils.isLengthEqualTo(value, 0)) {
      return "Masukkan nomor telpon yg valid";
    }
    return null;
  }

  void checkOtpRegisterValidation() {
    final isValid = otpRegisterFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      Get.toNamed(AppPages.OTP_REGISTER);
    }
    otpRegisterFormKey.currentState!.save();
  }
}