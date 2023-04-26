import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/webscreen_controller.dart';

class WebscreenView extends GetView<WebscreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebscreenView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: WebViewWidget(
          controller: controller.controllerWebView,
        ),
      ),
    );
  }
}
