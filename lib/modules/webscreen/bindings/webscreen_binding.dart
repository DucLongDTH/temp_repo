import 'package:get/get.dart';

import '../controllers/webscreen_controller.dart';

class WebscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebscreenController>(
      () => WebscreenController(),
    );
  }
}
