import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hyperbike/routes/app_pages.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  late TextEditingController phoneController, nameController, emailController;
  var phone = '', name = '', email = '';

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneController.dispose();
    nameController.dispose();
    emailController.dispose();
  }

  String? validatePhone(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return "Masukkan nomor telpon yg valid";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Masukkan alamat email yg valid";
    }
    return null;
  }

  String? validateName(String value) {
    if (value.length < 3) {
      return "Masukkan nama dengan benar";
    }
    return null;
  }

  void checkRegisterValidation() {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      Get.toNamed(AppPages.OTP_REGISTER);
    }
    registerFormKey.currentState!.save();
  }
}
