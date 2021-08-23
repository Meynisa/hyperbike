import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyperbike/auth/controllers/otp_register_controller.dart';
import 'package:hyperbike/utils/alert_dialog_model.dart';
import 'package:hyperbike/utils/constant_util.dart';
import 'package:hyperbike/utils/log_util.dart';

class OtpRegisterPage extends GetView<OtpRegisterController> {
  FocusNode _firstFocus = FocusNode();
  FocusNode _secondFocus = FocusNode();
  FocusNode _thirdFocus = FocusNode();
  FocusNode _fourthFocus = FocusNode();

  bool isOtpLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: isOtpLogin
            ? null
            : AppBar(
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
            isOtpLogin
                ? Positioned(
                    left: 0,
                    right: 0,
                    top: 70,
                    child: Container(
                        height: 30,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/img_bg.png',
                          fit: BoxFit.fitHeight,
                        )),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child: Image.asset(
                      'assets/images/img_appbar.png',
                      fit: BoxFit.fill,
                    ),
                  ),
            isOtpLogin
                ? Container()
                : Positioned(
                    left: 0,
                    right: 0,
                    top: 30,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.only(
                            top: 20, left: 8, right: 8, bottom: 8),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color.fromRGBO(20, 86, 163, 0.2),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40.0),
                              bottomRight: Radius.circular(40.0),
                            )),
                        child: Text(
                            'Nomor telepon yang digunakan sudah terdaftar',
                            style: GoogleFonts.karla(
                                fontSize: 14, color: ConstantsUtil.cIndigo),
                            textAlign: TextAlign.center)),
                  ),
            SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 100),
                  Column(children: [
                    Text(
                        'Silakan Masukkan kode OTP yang telah dikirikan melalui sms ke',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle2),
                    SizedBox(height: 16),
                    Text('+62xxxxxxxxxx',
                        style: GoogleFonts.karla(
                            fontSize: 14, fontWeight: FontWeight.w700)),
                    SizedBox(height: 40),
                    Text('Kode OTP',
                        style: GoogleFonts.karla(
                            fontSize: 14, fontWeight: FontWeight.w700)),
                    _otpField(context),
                    TextButton(
                        onPressed: () {},
                        child: Text('Kirim Ulang Kode OTP',
                            style: GoogleFonts.karla(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: ConstantsUtil.cIndigo)
                                .copyWith(
                                    decoration: TextDecoration.underline))),
                  ]),
                  SizedBox(height: MediaQuery.of(context).size.height - (isOtpLogin? 460 : 600)),
                  _column2(context),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _column2(BuildContext context) {
    return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              isOtpLogin ? Container() : Container(
                  height: 30,
                  child: Image.asset(
                    'assets/images/img_bg.png',
                    fit: BoxFit.fitHeight,
                    color: Colors.blue.withOpacity(0.3),
                  )),
              isOtpLogin ? Container() : SizedBox(height: 30),
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
                  onPressed: controller.firstController.text.length > 0 &&
                          controller.secondController.text.length > 0 &&
                          controller.thirdController.text.length > 0 &&
                          controller.fourthController.text.length > 0
                      ? () {
                          // Navigator.pop(context);
                          AlertDialogCustom().alertDialog(
                              context,
                              'Pendaftaran Berhasil',
                              'Terima Kasih telah mendaftar, kami akan segera menghubungi Anda',
                              imgAsset: 'assets/icons/ic_checked.png');
                        }
                      : null),
            ],
          );
  }

  Row _otpField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 80,
            width: (MediaQuery.of(context).size.width / 4) - 48,
            child: TextFormField(
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              maxLength: 1,
              onSaved: (value) => controller.first = value!,
              autocorrect: false,
              validator: (value) {
                return controller.validateNumber(value!);
              },
              focusNode: _firstFocus,
              controller: controller.firstController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.length < 0) {
                  LogUtil().loggingTest(value);
                } else {
                  _secondFocus.requestFocus();
                }
              },
              decoration: InputDecoration(counterText: ""),
            )),
        SizedBox(width: 16),
        Container(
            height: 80,
            width: (MediaQuery.of(context).size.width / 4) - 48,
            child: TextFormField(
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              maxLength: 1,
              onSaved: (value) => controller.second = value!,
              autocorrect: false,
              validator: (value) {
                return controller.validateNumber(value!);
              },
              focusNode: _secondFocus,
              controller: controller.secondController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.length < 0) {
                  LogUtil().loggingTest(value);
                } else {
                  _thirdFocus.requestFocus();
                }
              },
              decoration: InputDecoration(counterText: ""),
            )),
        SizedBox(width: 16),
        Container(
            height: 80,
            width: (MediaQuery.of(context).size.width / 4) - 48,
            child: TextFormField(
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              maxLength: 1,
              onSaved: (value) => controller.third = value!,
              autocorrect: false,
              validator: (value) {
                return controller.validateNumber(value!);
              },
              focusNode: _thirdFocus,
              controller: controller.thirdController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.length < 0) {
                  LogUtil().loggingTest(value);
                } else {
                  _fourthFocus.requestFocus();
                }
              },
              decoration: InputDecoration(counterText: ""),
            )),
        SizedBox(width: 16),
        Container(
            height: 80,
            width: (MediaQuery.of(context).size.width / 4) - 48,
            child: TextFormField(
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              maxLength: 1,
              onSaved: (value) => controller.fourth = value!,
              autocorrect: false,
              validator: (value) {
                return controller.validateNumber(value!);
              },
              focusNode: _fourthFocus,
              controller: controller.fourthController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.length < 0) {
                  LogUtil().loggingTest(value);
                } else {
                  _fourthFocus.unfocus();
                }
              },
              decoration: InputDecoration(counterText: ""),
            )),
      ],
    );
  }
}
