import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:ionmobile/constants/R.dart';
import 'package:ionmobile/constants/theme_provider.dart';
import 'package:ionmobile/modules/widgets/ion_button.dart';
import 'package:ionmobile/modules/widgets/ion_text_field.dart';
import 'package:ionmobile/modules/widgets/utils.dart';

import '../controllers/provide_fullname_controller.dart';

class ProvideFullnameView extends GetView<ProvideFullnameController> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((Duration _) {
      if (controller.isOpenFirstTime) {
        FocusScope.of(context).requestFocus(controller.focusNodeFirstName);
        controller.isOpenFirstTime = false;
      }
    });
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.focusedChild?.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: ThemeProvider.bgScreen,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.arrow_back_ios),
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'what_is_your_name'.tr,
                        style: TextStyle(
                            fontSize: 28, fontFamily: ThemeProvider.fontBold),
                      ),
                      SizedBox(height: 24),
                      _buildFirstName(),
                      SizedBox(height: 16),
                      _buildLastName(),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildPolicy(),
                      SizedBox(height: 16),
                      Obx(
                        () => IonButton(
                                title: 'continue'.tr,
                                onPressed: () {},
                                isDisable: controller.isDisableButton.value
                                    ? true
                                    : false,
                                styleButton: IonButtonStyle.fill)
                            .paddingOnly(bottom: 16),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  _buildFirstName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'first_name'.tr,
          style: TextStyle(
              fontFamily: ThemeProvider.fontRegular,
              fontSize: ThemeProvider.fontSize16),
        ),
        SizedBox(height: 8),
        IonTextField(
          // autofocus: true,
          focusNode: controller.focusNodeFirstName,
          textEditingController: controller.firstNameController,
          inputDecoration: inputDecorationTextField(
              hintText: 'Hasan',
              contentPadding: EdgeInsets.only(left: 16),
              isValidate: controller.isValidate.value,
              focusNode: controller.focusNodeFirstName,
              textEditingController: controller.firstNameController),
          onChanged: (value) {
            controller.isValidate.value = true;
            controller.checkDisableButton();
          },
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  _buildLastName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: 'last_name'.tr + ' ',
              style: TextStyle(
                  fontFamily: ThemeProvider.fontRegular,
                  fontSize: ThemeProvider.fontSize16),
              children: [
                TextSpan(
                  text: 'optional'.tr,
                  style: TextStyle(
                      fontFamily: ThemeProvider.fontExtraLight,
                      fontSize: ThemeProvider.fontSize16),
                )
              ]),
        ),
        SizedBox(height: 8),
        IonTextField(
          focusNode: controller.focusNodeLastName,
          textEditingController: controller.lastNameController,
          inputDecoration: inputDecorationTextField(
              hintText: 'Halaman',
              contentPadding: EdgeInsets.only(left: 16),
              isValidate: true,
              focusNode: controller.focusNodeLastName,
              textEditingController: controller.lastNameController),
          onChanged: (value) {},
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }

  _buildPolicy() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            controller.isCheckPolicy.value = !controller.isCheckPolicy.value;
            controller.checkDisableButton();
          },
          child: Container(
            width: 14,
            height: 14,
            child: Obx(() => controller.isCheckPolicy.value
                ? SvgPicture.asset(R.icCheckbox)
                : SvgPicture.asset(R.icUncheckbox)),
          ),
        ),
        SizedBox(width: 8),
        RichText(
          text: TextSpan(
              text: 'i_agree_to'.tr + ' ',
              style: TextStyle(
                  fontFamily: ThemeProvider.fontRegular,
                  fontSize: ThemeProvider.fontSize12),
              children: [
                TextSpan(
                  text: 'privacy_policy'.tr,
                  style: TextStyle(
                      fontFamily: ThemeProvider.fontBold,
                      fontSize: ThemeProvider.fontSize12),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _openBottomSheet();
                    },
                )
              ]),
        ),
      ],
    );
  }

  void _openBottomSheet() {
    Get.bottomSheet(Container(
      height: 470,
      color: ThemeProvider.bgBottomSheet,
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 21, 16, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'privacy_policy'.tr,
              style: TextStyle(
                  color: ThemeProvider.colorTextTitle,
                  fontFamily: ThemeProvider.fontBold,
                  fontSize: ThemeProvider.fontSize16),
            ),
            SizedBox(height: 8),
            Text(
              'policy_content'.tr,
              style: TextStyle(
                  height: 2,
                  // letterSpacing: 2,
                  color: ThemeProvider.colorTextPolicy,
                  fontFamily: ThemeProvider.fontLight,
                  fontSize: ThemeProvider.fontSize14),
            ),
          ],
        ),
      ),
    ));
  }
}
