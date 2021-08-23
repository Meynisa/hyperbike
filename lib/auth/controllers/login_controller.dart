import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hyperbike/routes/app_pages.dart';
import 'package:hyperbike/utils/log_util.dart';

class LoginController extends GetxController{

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController phoneController;
  var phone = '';

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneController.dispose();
  }

  String? validatePhone(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return "Masukkan nomor telpon yg valid";
    }
    return null;
  }

  void checkLogin() {
     final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      LogUtil().loggingTest('!isValid: ${!isValid}');
      return;
    }else{
      LogUtil().loggingTest('!isValid: ${!isValid}');
      Get.toNamed(AppPages.OTP_REGISTER);
    }
    loginFormKey.currentState!.save();
  }
}