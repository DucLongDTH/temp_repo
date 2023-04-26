import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/provide_fullname_controller.dart';

class ProvideFullnameView extends GetView<ProvideFullnameController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProvideFullnameView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProvideFullnameView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
