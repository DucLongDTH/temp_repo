import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionmobile/constants/constant.dart';
import 'package:ionmobile/routes/app_pages.dart';

class VerifyAuthcodeController extends GetxController {
  final isOverTimer = false.obs;
  var resendCodeCounter = 2;
  final duration = Duration(seconds: 1);
  int secondsCountDown = 10;
  Timer? _timer;
  int remainingSeconds = 1;
  final timerStr = '00:10'.obs;
  var pinTextController = TextEditingController();
  var isFlowLogin = true;

  @override
  void onInit() {
    isFlowLogin = Get.arguments[AppParameters.isFlowLogin] ?? true;
    _startTimer(secondsCountDown);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    pinTextController.clear();
  }

  _startTimer(int seconds) {
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        isOverTimer.value = true;
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        timerStr.value = minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainingSeconds--;
      }
    });
  }

  void resendCode() {
    if (resendCodeCounter > 0) {
      resendCodeCounter = resendCodeCounter - 1;
      timerStr.value = '00:10';
      _startTimer(secondsCountDown);
      isOverTimer.value = false;
    } else {}
  }

  void authenOTP(String v) {
    if (v == '0000') {
      if (isFlowLogin) {
        Get.offAllNamed(Routes.MAIN);
      } else {
        Get.offAllNamed(Routes.SELECT_LANGUAGE,
            arguments: {AppParameters.isFlowLogin: false});
      }
    } else {
      // show error
    }
  }
}
