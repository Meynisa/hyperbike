import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyperbike/utils/constant_util.dart';

InputDecoration inputDecorationModel(String lblText,
    {Widget? prefixIcon,
    Widget? suffixIcon,
    bool isSuffix = false,
    String? hintText,
    bloc,
    bool? seen,
    String? prefixText,
    isAuth = true}) {
  return InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    labelText: lblText,
    fillColor: Colors.white,
    filled: true,
    suffixIcon: suffixIcon,
    prefixIcon: Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 4.0),
      child: prefixIcon,
    ),
    prefixText: prefixText,
    prefixStyle: GoogleFonts.karla(fontSize: 16, fontWeight: FontWeight.w700),
    // errorStyle: dynamicTextStyle(color: Colors.red),
    prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
    errorText: null,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.15)),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: ConstantsUtil.cIndigo),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(4))),
  );
}
