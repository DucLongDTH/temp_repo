import 'package:get/get.dart';

import '../controllers/provide_fullname_controller.dart';

class ProvideFullnameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProvideFullnameController>(
      () => ProvideFullnameController(),
    );
  }
}
