import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyperbike/auth/controllers/login_controller.dart';
import 'package:hyperbike/routes/app_pages.dart';
import 'package:hyperbike/utils/constant_util.dart';
import 'package:hyperbike/utils/input_decoration_util.dart';
import 'package:get/state_manager.dart';

class LoginPage extends GetView<LoginController> {
  FocusNode phoneFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                    EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color.fromRGBO(20, 86, 163, 0.2),
                    ),
                    child: Text('Nomor telepon yang digunakan sudah terdaftar',
                        style: GoogleFonts.karla(
                            fontSize: 14, color: ConstantsUtil.cIndigo),
                        textAlign: TextAlign.center)),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: controller.loginFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                      Image.asset('assets/images/img_bg.png',
                          fit: BoxFit.contain),
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
                              suffixIcon: phoneFocus.hasFocus == false
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () => controller
                                          .phoneController.text = '',
                                      child: Icon(
                                          FontAwesomeIcons.timesCircle,
                                          color: ConstantsUtil.cIndigo),
                                    ),
                              isSuffix: true,
                              prefixIcon: Text("+62",
                                  style: GoogleFonts.karla(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: ConstantsUtil.cIndigo)))),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: ()=> Get.toNamed(AppPages.FORGOT_PASSWORD),
                              child: Text(
                                'Lupa Password?',
                                style: GoogleFonts.karla(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: ConstantsUtil.cIndigo),
                              )))
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: MaterialButton(
                          disabledColor: ConstantsUtil.cGrey,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              'MASUK',
                              style: GoogleFonts.karla(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          color: ConstantsUtil.cIndigo,
                          onPressed: !GetUtils.isPhoneNumber(
                                  controller.phoneController.text)
                              ? null
                              : () {
                                  controller.checkLogin();
                                  phoneFocus.unfocus();
                                }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ingin bergabung dengan kami?',
                          style: GoogleFonts.karla(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        TextButton(
                            onPressed: () {
                             Get.toNamed(AppPages.REGISTER);
                            },
                            child: Text(
                              'Daftar',
                              style: GoogleFonts.rubik(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: ConstantsUtil.cIndigo),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
