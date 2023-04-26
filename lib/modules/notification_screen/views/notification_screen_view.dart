import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_screen_controller.dart';

class NotificationScreenView extends GetView<NotificationScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotificationScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text(
              'NotificationScreenView is working' +
                  controller.count.value.toString(),
              style: TextStyle(fontSize: 20),
            )),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.increment();
      }),
    );
  }
}
