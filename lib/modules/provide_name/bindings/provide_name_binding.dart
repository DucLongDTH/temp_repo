import 'package:get/get.dart';

import '../controllers/provide_name_controller.dart';

class ProvideNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProvideNameController>(
      () => ProvideNameController(),
    );
  }
}
