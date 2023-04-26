import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ionmobile/app_controller.dart';
import 'package:ionmobile/constants/theme_provider.dart';
import 'package:ionmobile/modules/widgets/utils.dart';

import '../../constants/R.dart';

class IonPhoneField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String value) onChanged;
  final bool isValidate;
  final bool isEnable;
  final FocusNode focusNode;

  IonPhoneField(
      {required this.textEditingController,
      required this.focusNode,
      required this.onChanged,
      this.isEnable = true,
      required this.isValidate});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      enabled: isEnable,
      focusNode: focusNode,
      style: TextStyle(
          fontFamily: ThemeProvider.fontRegular,
          fontSize: 16,
          color: isEnable
              ? Colors.white
              : ThemeProvider.textColorButtonOutlineDisable),
      dropdownTextStyle: TextStyle(
          fontFamily: ThemeProvider.fontRegular,
          fontSize: 16,
          color: isEnable
              ? Colors.white
              : ThemeProvider.textColorButtonOutlineDisable),
      controller: textEditingController,
      cursorColor: Colors.white,
      autovalidateMode: AutovalidateMode.disabled,
      disableLengthCheck: true,
      showCountryFlag: false,
      showDropdownIcon: false,
      decoration: inputDecorationTextField(
          contentPadding: EdgeInsets.zero,
          focusNode: focusNode,
          textEditingController: textEditingController,
          isValidate: isValidate),
      onChanged: (phone) {
        onChanged.call(phone.completeNumber);
        print(phone.completeNumber);
      },
      onCountryChanged: (country) {
        print('Country changed to: ' + country.name);
      },
      initialCountryCode: 'ID',
      // pickerDialogStyle: ,
    );
  }
}
