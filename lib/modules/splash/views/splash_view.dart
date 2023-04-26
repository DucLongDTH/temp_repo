import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:ionmobile/constants/R.dart';
import 'package:ionmobile/constants/theme_provider.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeProvider.bgScreen,
      body: GetBuilder<SplashController>(
        builder: (controller) {
          return Center(
            child: Image.asset(
              'assets/image/ion_logo.png',
            ),
          );
        },
      ),
    );
  }
}
