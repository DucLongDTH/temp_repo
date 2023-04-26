import 'package:flutter/material.dart';
import 'package:ionmobile/constants/theme_provider.dart';

enum IonButtonStyle { fill, outline }

class IonButton extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final bool isDisable;
  final VoidCallback onPressed;
  final IonButtonStyle styleButton;
  final Color? backgroundColor;
  final Color? borderColor;

  IonButton(
      {required this.title,
      required this.onPressed,
      required this.styleButton,
      this.textStyle,
      this.isDisable = false,
      this.width,
      this.height,
      this.backgroundColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    var _boxDecoration = BoxDecoration();
    var _textColor = Colors.black;
    switch (styleButton) {
      case IonButtonStyle.fill:
        _boxDecoration = BoxDecoration(
          color: isDisable
              ? ThemeProvider.bgButtonFillDisable
              : ThemeProvider.bgButtonFill,
        );
        _textColor = isDisable
            ? ThemeProvider.textColorButtonDisable
            : ThemeProvider.textColorButton;
        break;
      case IonButtonStyle.outline:
        _boxDecoration = BoxDecoration(
            color: isDisable
                ? ThemeProvider.bgButtonOutlineDisable
                : ThemeProvider.bgButtonOutline,
            border: Border.all(
                color: isDisable
                    ? ThemeProvider.borderButtonOutlineDisable
                    : ThemeProvider.borderButtonOutline));
        _textColor = isDisable
            ? ThemeProvider.textColorButtonOutlineDisable
            : ThemeProvider.textColorButtonOutline;
        break;
    }

    return Material(
      child: InkWell(
          onTap: () {
            if (!isDisable) onPressed.call();
          },
          child: isDisable
              ? Container(
                  width: width ?? double.infinity,
                  height: height ?? 44,
                  decoration: _boxDecoration,
                  child: Center(
                    child: Text(
                      title,
                      style: textStyle?.copyWith(color: _textColor) ??
                          TextStyle(
                              fontFamily: ThemeProvider.fontSemiBold,
                              fontSize: 16,
                              color: _textColor),
                    ),
                  ),
                )
              : Ink(
                  width: width ?? double.infinity,
                  height: height ?? 44,
                  decoration: _boxDecoration,
                  child: Center(
                    child: Text(
                      title,
                      style: textStyle?.copyWith(color: _textColor) ??
                          TextStyle(
                              fontFamily: ThemeProvider.fontSemiBold,
                              fontSize: 16,
                              color: _textColor),
                    ),
                  ),
                )),
    );
  }
}
