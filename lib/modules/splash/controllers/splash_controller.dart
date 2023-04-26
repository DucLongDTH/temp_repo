import 'package:get/get.dart';
import 'package:ionmobile/app_controller.dart';
import 'package:ionmobile/routes/app_pages.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _checkingLanguage();
    Future.delayed(Duration(seconds: 1), () {
      var appController = Get.find<AppController>();
      if (appController.isUserLogined.value) {
        Get.offAndToNamed(Routes.MAIN);
      } else {
        Get.offAndToNamed(Routes.LOGIN);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void _checkingLanguage() {}
}
