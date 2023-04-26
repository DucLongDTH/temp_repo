import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/provide_name_controller.dart';

class ProvideNameView extends GetView<ProvideNameController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProvideNameView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProvideNameView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
