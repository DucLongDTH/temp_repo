import 'package:get/get.dart';
import 'package:ionmobile/modules/home/controllers/home_controller.dart';
import 'package:ionmobile/modules/notification_screen/controllers/notification_screen_controller.dart';
import 'package:ionmobile/modules/personal/controllers/personal_controller.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<NotificationScreenController>(
      () => NotificationScreenController(),
    );
    Get.lazyPut<PersonalController>(
      () => PersonalController(),
    );
  }
}
