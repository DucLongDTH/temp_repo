import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreenController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    debugPrint('onInit Notification Screen');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
