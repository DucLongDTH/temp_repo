import 'package:get/get.dart';

import '../controllers/verify_authcode_controller.dart';

class VerifyAuthcodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyAuthcodeController>(
      () => VerifyAuthcodeController(),
    );
  }
}
