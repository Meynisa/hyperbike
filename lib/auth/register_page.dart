import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyperbike/auth/controllers/register_controller.dart';
import 'package:hyperbike/routes/app_pages.dart';
import 'package:hyperbike/utils/constant_util.dart';
import 'package:hyperbike/utils/input_decoration_util.dart';

class RegisterPage extends GetView<RegisterController> {
  FocusNode phoneFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode nameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: ConstantsUtil.cIndigo,
            title: Text("Buat Akun Baru",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
            )),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: Image.asset(
                'assets/images/img_appbar.png',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 30,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 8),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color.fromRGBO(20, 86, 163, 0.2),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                      )),
                  child: Text('Nomor telepon yang digunakan sudah terdaftar',
                      style: GoogleFonts.karla(
                          fontSize: 14, color: ConstantsUtil.cIndigo),
                      textAlign: TextAlign.center)),
            ),
            Form(
              key: controller.registerFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _column1(),
                    SizedBox(height: MediaQuery.of(context).size.height - 560),
                    _column2(context),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _column1() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 80),
        TextFormField(
            focusNode: emailFocus,
            controller: controller.emailController,
            onSaved: (value) => controller.email = value!,
            autocorrect: false,
            validator: (value) {
              return controller.validateEmail(value!);
            },
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.emailAddress,
            decoration: inputDecorationModel('Email',
                prefixIcon:
                    Icon(Icons.email_outlined, color: ConstantsUtil.cIndigo))),
        SizedBox(height: 30),
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
            decoration: inputDecorationModel('xxxxxxxxxx',
                prefixIcon: Text("+62",
                    style: GoogleFonts.karla(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ConstantsUtil.cIndigo)))),
        SizedBox(height: 30),
        TextFormField(
            focusNode: nameFocus,
            controller: controller.nameController,
            onSaved: (value) => controller.name = value!,
            autocorrect: false,
            validator: (value) {
              return controller.validateName(value!);
            },
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.name,
            decoration: inputDecorationModel('Name',
                prefixIcon: Icon(Icons.person_outline_rounded,
                    color: ConstantsUtil.cIndigo))),
      ],
    );
  }

  Widget _column2(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            height: 30,
            child: Image.asset(
              'assets/images/img_bg.png',
              fit: BoxFit.fitHeight,
              color: Colors.blue.withOpacity(0.3),
            )),
        SizedBox(height: 30),
        MaterialButton(
            height: 50,
            disabledColor: ConstantsUtil.cGrey,
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
            onPressed: () => Get.toNamed(AppPages.OTP_REGISTER)
            //     !GetUtils.isEmail(controller.emailController.text) ||
            //         !GetUtils.isPhoneNumber(controller.phoneController.text) ||
            //         controller.nameController.text.length < 3
            //         ? null
            //         :
            //     () {
            //   controller.checkRegisterValidation();
            //   phoneFocus.unfocus();
            // }
            ),
      ],
    );
  }
}
