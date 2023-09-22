import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle{
  //*************** Font Style ********************

  static final playFont = GoogleFonts.play(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static final playFontBold = GoogleFonts.play(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static final playFont16 = GoogleFonts.play(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static final playFont16Bold = GoogleFonts.play(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static final sigNikaFont = GoogleFonts.signika(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  //*************** Font Size ********************
  static const font14 = 14.0;
  static const font16 = 16.0;
  static const font18 = 18.0;
  static const font20 = 20.0;
  static const font22 = 22.0;


  //*************** Content Spacing ***************

  //Height
  static final height10 = SizedBox(height: Get.height*0.01,);
  static final height20 = SizedBox(height: Get.height*0.02,);
  static final height30 = SizedBox(height: Get.height*0.03,);
  static final height40 = SizedBox(height: Get.height*0.04,);

  //Width
  static final width10 = SizedBox(width: Get.width*0.01,);
  static final width20 = SizedBox(width: Get.width*0.02,);
  static final width30 = SizedBox(width: Get.width*0.03,);
  static final width40 = SizedBox(width: Get.width*0.04,);

  //*************** Padding ***************
  static const padding5 = 5.0;
  static const padding10 = 10.0;
  static const padding15 = 15.0;
  static const padding20 = 20.0;

  //*************** Border Radius ***************
  static const radius5 = 5.0;
  static const radius10 = 10.0;
  static const radius15 = 15.0;
  static const radius20 = 20.0;
}