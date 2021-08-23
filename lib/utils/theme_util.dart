import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyperbike/utils/constant_util.dart';

final ThemeData defaultTheme = new ThemeData(
  bottomAppBarColor: ConstantsUtil.cIndigo,
  cursorColor: ConstantsUtil.cIndigo,
  backgroundColor: Colors.white,
  buttonColor: ConstantsUtil.cIndigo,
  disabledColor: Color.fromRGBO(208, 208, 208, 1),
  textTheme: TextTheme(
    headline1: GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w700),
    headline2: GoogleFonts.karla(fontSize: 24, fontWeight: FontWeight.w700),
    headline3: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
    headline4: GoogleFonts.karla(fontSize: 18, fontWeight: FontWeight.w500),
    bodyText1: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400),
    bodyText2: GoogleFonts.karla(fontSize: 16, fontWeight: FontWeight.w400),
    subtitle1: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w400),
    subtitle2: GoogleFonts.karla(fontSize: 14, fontWeight: FontWeight.w400),

  ),
  primaryColor: Colors.white,
  accentColor: ConstantsUtil.cIndigo,
  accentColorBrightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
