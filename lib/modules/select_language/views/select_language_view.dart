import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionmobile/localizations/location.dart';

import '../controllers/select_language_controller.dart';

class SelectLanguageView extends GetView<SelectLanguageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('select_language'.tr),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      title: Text('English'),
                      trailing: Obx(() => Radio<Locale>(
                            value: LocalizationService.listLocaleSupport[0],
                            groupValue: controller.currentLocale.value,
                            onChanged: (Locale? value) {
                              controller.currentLocale.value = value;
                            },
                          )),
                    ),
                  ),
                  Card(
                    // color: Colors.yellow,
                    child: ListTile(
                        title: Text('Indonesia (Bahasa)'),
                        trailing: Obx(() => Radio<Locale>(
                              value: LocalizationService.listLocaleSupport[1],
                              groupValue: controller.currentLocale.value,
                              onChanged: (Locale? value) {
                                controller.currentLocale.value = value;
                              },
                            ))),
                  ),
                ],
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  controller.updateLocale();
                },
                child: Text('save'.tr))
          ],
        ),
      ),
    );
  }
}
