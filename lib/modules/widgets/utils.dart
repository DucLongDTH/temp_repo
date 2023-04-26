import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionmobile/constants/R.dart';
import 'package:ionmobile/constants/theme_provider.dart';

InputDecoration inputDecorationTextField(
    {required bool isValidate,
    required FocusNode focusNode,
    required TextEditingController textEditingController,
    EdgeInsetsGeometry? contentPadding,
    String? hintText}) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
          color: ThemeProvider.colorTextHint,
          fontFamily: ThemeProvider.fontRegular,
          fontSize: ThemeProvider.fontSize16),
      contentPadding: contentPadding ?? EdgeInsets.zero,
      suffixIcon: !isValidate
          ? focusNode.hasFocus
              ? Padding(
                  padding: EdgeInsets.only(top: 14, bottom: 14, right: 18),
                  child: GestureDetector(
                      onTap: () => textEditingController.clear(),
                      child: SvgPicture.asset(R.removeCircle)),
                )
              : Padding(
                  padding: EdgeInsets.only(top: 14, bottom: 14, right: 18),
                  child: SvgPicture.asset(
                    R.alertCircle,
                  ),
                )
          : focusNode.hasFocus
              ? Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 12, right: 18),
                  child: GestureDetector(
                      onTap: () => textEditingController.clear(),
                      child: SvgPicture.asset(R.removeCircle)),
                )
              : null,
      isDense: false,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.black,
        ),
      ),
      errorText: isValidate ? null : '',
      errorStyle: TextStyle(fontSize: 0),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ThemeProvider.borderButtonOutlineDisable),
          borderRadius: BorderRadius.zero),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.zero),
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ThemeProvider.borderButtonOutlineDisable),
          borderRadius: BorderRadius.zero),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.zero),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ThemeProvider.borderButtonOutlineDisable),
          borderRadius: BorderRadius.zero));
}
