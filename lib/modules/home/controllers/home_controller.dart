import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class HomeController extends GetxController {
  RxBool isValidate = true.obs;
  final TextEditingController textcontroller = TextEditingController();
  String initialCountry = 'IDN';
  PhoneNumber number = PhoneNumber(isoCode: 'ID');
  final count = 0.obs;
  @override
  void onInit() {
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
