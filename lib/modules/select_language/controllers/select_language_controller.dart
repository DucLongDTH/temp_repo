import 'package:get/get.dart';
import 'package:ionmobile/constants/constant.dart';
import 'package:ionmobile/localizations/location.dart';
import 'package:ionmobile/routes/app_pages.dart';

class SelectLanguageController extends GetxController {
  var currentLocale = Get.locale.obs;
  bool? isFlowLogin;
  @override
  void onInit() {
    isFlowLogin = Get.arguments[AppParameters.isFlowLogin];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void updateLocale() {
    Get.updateLocale(
        currentLocale.value ?? LocalizationService.fallbackLocale);
        if(isFlowLogin == false){
          Get.offAndToNamed(Routes.MAIN);
        }
  }
}
