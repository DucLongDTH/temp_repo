import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ionmobile/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  RxBool isValidate = true.obs;
  RxBool isDisableButton = true.obs;
  final TextEditingController textcontroller = TextEditingController();
  FocusNode focusNodeTextField = FocusNode();

  String initialCountry = 'IDN';
  PhoneNumber number = PhoneNumber(isoCode: 'ID');
  final isLoginByPhone = true.obs;
  var _redirecting = false;

  @override
  void onInit() {
    focusNodeTextField.addListener(() {
      isDisableButton.value = textcontroller.text.isEmpty;
    });

    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      debugPrint('======= listen supabase');
      if (_redirecting) return;
      final session = data.session;
      if (session != null) {
        _redirecting = true;
        Get.toNamed(Routes.PROVIDE_FULLNAME);
        _resetData();
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> login() async {
    focusNodeTextField.unfocus();
    isLoginByPhone.value ? checkValidatePhoneNumber() : checkValidateEmail();
    if (isValidate.value) {
      try {
        await Supabase.instance.client.auth.signInWithOtp(
            email: 'long.nguyen2@ntq-solution.com.vn',
            emailRedirectTo: kIsWeb
                ? null
                : 'io.supabase.flutterquickstart://login-callback/');
      } on AuthException catch (error) {
        debugPrint(error.message);
      } catch (error) {
        debugPrint('Unexpected error occurred');
      }
    } else {
      print('login not ok');
    }
  }

  void changeTypeLogin() {
    isLoginByPhone.value = !isLoginByPhone.value;
    isValidate.value = true;
    textcontroller.clear();
    focusNodeTextField.unfocus();
    isDisableButton.value = true;
  }

  void checkValidatePhoneNumber() {
    isValidate.value = GetUtils.isPhoneNumber(textcontroller.text);
  }

  void checkValidateEmail() {
    isValidate.value = GetUtils.isEmail(textcontroller.text);
  }

  void goToRegisterFlow() => Get.toNamed(Routes.PROVIDE_FULLNAME);

  void _resetData() {
    focusNodeTextField.unfocus();
    textcontroller.clear();
    isDisableButton.value = true;
    isValidate.value = true;
  }
}
