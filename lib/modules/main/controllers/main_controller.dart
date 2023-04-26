import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionmobile/modules/home/views/home_view.dart';
import 'package:ionmobile/modules/notification_screen/views/notification_screen_view.dart';
import 'package:ionmobile/modules/personal/views/personal_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainController extends GetxController {


  final List<Widget> list = [HomeView(),NotificationScreenView(),PersonalView()];
  final PersistentTabController controllerNavView = PersistentTabController(initialIndex: 0);
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
