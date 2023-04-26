import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProvideFullnameController extends GetxController {
  RxBool isValidate = true.obs;
  RxBool isDisableButton = true.obs;
  final TextEditingController firstNameController = TextEditingController();
  FocusNode focusNodeFirstName = FocusNode();
  final TextEditingController lastNameController = TextEditingController();
  FocusNode focusNodeLastName = FocusNode();

  bool isOpenFirstTime = true;

  RxBool isCheckPolicy = true.obs;

  @override
  void onInit() {
    focusNodeFirstName.addListener(() {
      checkDisableButton();
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void checkDisableButton() {
    var disableButton = true;
    if (firstNameController.text.isNotEmpty && isCheckPolicy.value == true) {
      disableButton = false;
    }

    isDisableButton.value = disableButton;
  }
}
