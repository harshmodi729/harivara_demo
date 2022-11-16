import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harivara_demo/utils/app_color.dart';

extension Number on num {
  Widget hSpace() {
    return SizedBox(height: toDouble());
  }

  Widget wSpace() {
    return SizedBox(width: toDouble());
  }
}

extension AppText on FontWeight {
  Widget text(
    String text, {
    double fontSize = 16,
    Color color = AppColor.appColor,
    TextAlign textAlign = TextAlign.start,
  }) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontWeight: this,
        fontSize: fontSize,
        color: color,
      ),
      textAlign: textAlign,
    );
  }

  TextStyle textStyle({
    double fontSize = 16,
    Color fontColor = AppColor.appColor,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: this,
      color: fontColor,
    );
  }
}
