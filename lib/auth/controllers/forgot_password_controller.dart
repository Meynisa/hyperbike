import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hyperbike/routes/app_pages.dart';

class ForgotPasswordController extends GetxController {
  final GlobalKey<FormState> forgotPassFormKey = GlobalKey<FormState>();

  late TextEditingController phoneController;
  var phone = '';
  bool isValid = false;

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
    isValid = forgotPassFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }else{
      Get.toNamed(AppPages.REGISTER);
    }
    forgotPassFormKey.currentState!.save();
  }
}
