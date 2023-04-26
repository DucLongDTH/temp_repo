import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/verify_authcode_controller.dart';

class VerifyAuthcodeView extends GetView<VerifyAuthcodeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: 10),
              Text(
                'Verify',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Verify Audition has been sent to'),
              SizedBox(height: 50),
              _buildPinCode(context),
              Obx(() => controller.isOverTimer.value ? GestureDetector(
                onTap: () {
                  controller.resendCode();
                },
                child: Text('Resend Again !')) : Text('Resend code' + ' ${controller.timerStr.value}')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPinCode(BuildContext context) {
    return PinCodeTextField(
      controller: controller.pinTextController,
      mainAxisAlignment: MainAxisAlignment.start,
      keyboardType: TextInputType.number,
      dialogConfig: DialogConfig(
          dialogContent: 'Paste code from clipboard: ',
          dialogTitle: 'Paste',
          negativeText: 'Cancel',
          affirmativeText: 'Ok'),
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          inactiveColor: Colors.blue,
          activeColor: Colors.blue,
          activeFillColor: Colors.transparent,
          inactiveFillColor: Colors.transparent,
          selectedFillColor: Colors.transparent,
          fieldOuterPadding: EdgeInsets.only(right: 20)),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      onCompleted: (v) {
        print("Completed");
        controller.authenOTP(v);
      },
      onChanged: (value) {
        print(value);
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        return true;
      },
      appContext: context,
    );
  }
}
