import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller.controllerNavView,
      screens: controller.list,
      items: _navBarsItems(),
      confineInSafeArea: true,
      navBarHeight: 56,
      backgroundColor: Colors.black,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: false,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 400),
      ),
      navBarStyle: NavBarStyle.style9,
      onItemSelected: (index) {},
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        textStyle: TextStyle(fontSize: 17),
        contentPadding: 0,
        icon: Icon(Icons.home),
        title: ("home"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        textStyle: TextStyle(fontSize: 17),
        contentPadding: 2,
        icon: Icon(Icons.notifications_on),
        title: ('Noti'),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        textStyle: TextStyle(fontSize: 17),
        contentPadding: 2,
        icon: Icon(Icons.person),
        title: ('personal'),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }
}
