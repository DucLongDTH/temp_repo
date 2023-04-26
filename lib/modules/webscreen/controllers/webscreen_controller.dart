import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebscreenController extends GetxController {
  var urlString = ''.obs;
  late WebViewController controllerWebView;
  @override
  void onInit() {
    urlString.value = 'https://ionmobility.com/product';
    controllerWebView
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(urlString.value));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
