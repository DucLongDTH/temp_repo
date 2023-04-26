import 'package:flutter/material.dart';

class ThemeProvider {
  ThemeProvider._();
  //FONT
  static final String fontBold = 'Oxanium-Bold';
  static final String fontExtraBold = 'Oxanium-ExtraBold';
  static final String fontExtraLight = 'Oxanium-ExtraLight';
  static final String fontLight = 'Oxanium-Light';
  static final String fontMedium = 'Oxanium-Medium';
  static final String fontRegular = 'Oxanium-Regular';
  static final String fontSemiBold = 'Oxanium-SemiBold';

  //FONTSIZE
  static final double fontSize16 = 16;
  static final double fontSize14 = 14;
  static final double fontSize12 = 12;

  // COLOR SCREEN
  static const Color bgScreen = Color(0xFF1F1F1F);
  static const Color bgBottomSheet = Color(0xFF1B1B1B);
  // COLOR BUTTON
  static const Color bgButtonFill = Color(0xFF24FFFF);
  static const Color bgButtonFillDisable = Color(0xFF1B1B1B);
  static const Color textColorButton = Color(0xFF151515);
  static const Color textColorButtonDisable = Color(0xFF545454);

  static const Color bgButtonOutline = Colors.transparent;
  static const Color bgButtonOutlineDisable = Colors.transparent;
  static const Color textColorButtonOutline = Color(0xFF24FFFF);
  static const Color textColorButtonOutlineDisable = Color(0xFF545454);
  static const Color borderButtonOutline = Color(0xFF24FFFF);
  static const Color borderButtonOutlineDisable = Color(0xFF545454);

  // TEXT COLOR
  static const Color colorTextTitle = Color(0xFFFCFCFC);
  static const Color colorTextTitleDisable = Color(0xFF545454);
  static const Color colorTextHint = Color(0xFF545454);
  static const Color colorTextPolicy = Color(0xFF999999);
}
