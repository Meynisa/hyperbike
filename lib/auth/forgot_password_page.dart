import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyperbike/auth/controllers/forgot_password_controller.dart';
import 'package:hyperbike/utils/constant_util.dart';
import 'package:hyperbike/utils/input_decoration_util.dart';
import 'package:get/state_manager.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  FocusNode phoneFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text("Bantuan\nMasuk",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
            color: ConstantsUtil.cIndigo,
          )),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 20, bottom: 70, left: 20, right: 20.0),
            child: Form(
              key: controller.forgotPassFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Masukkan nomor telepon yang ditautkan ke akun anda.',
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 60),
                  TextFormField(
                      focusNode: phoneFocus,
                      controller: controller.phoneController,
                      onSaved: (value) => controller.phone = value!,
                      autocorrect: false,
                      validator: (value) {
                        return controller.validatePhone(value!);
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.phone,
                      decoration: inputDecorationModel('825782352903',
                          // suffixIcon: phoneFocus.hasFocus == false
                          //     ? Container()
                          //     : GestureDetector(
                          //   onTap: () => controller
                          //       .phoneController.text = '',
                          //   child: Icon(
                          //       FontAwesomeIcons.timesCircle,
                          //       color: ConstantsUtil.cIndigo),
                          // ),
                          isSuffix: true,
                          prefixIcon: Text("+62",
                              style: GoogleFonts.karla(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: ConstantsUtil.cIndigo)))),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: MaterialButton(
                disabledColor: Color.fromRGBO(208, 208, 208, 1),
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    'SELANJUTNYA',
                    style: GoogleFonts.karla(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                color: ConstantsUtil.cIndigo,
                onPressed:
                    !GetUtils.isPhoneNumber(controller.phoneController.text)
                        ? null
                        : () {
                            controller.checkLogin();
                            phoneFocus.unfocus();
                          }),
          ),
        ],
      ),
    );
  }
}
