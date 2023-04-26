import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionmobile/api/api_webserver.dart';
import 'package:ionmobile/modules/widgets/circle_widget.dart';
import 'package:ionmobile/routes/app_pages.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CircleWidget.buildCircleColor(Colors.red, 200),
            _buildPhoneTextField(),
            _buildPinCode(context),
            ElevatedButton(
                onPressed: () {
                  launchUrl(
                    Uri.parse('https://wa.me/6281190069998'),
                    mode: LaunchMode.externalApplication,
                  );
                },
                child: Text('GO TO Whats APP')),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.WEBSCREEN);
                },
                child: Text('OpenWebView')),
            OutlinedButton(
                onPressed: () async {
                  _showEditNameSheet((value) {
                    print(value);
                  });
                  await ApiWebserver.shared.login();
                },
                child: Text('SHOW TEXT BUTTON'))
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneTextField() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.all(10),
          decoration:
              BoxDecoration(color: Colors.blueGrey[100], border: Border.all()),
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
              if (!GetUtils.isPhoneNumber(controller.textcontroller.text)) {
                controller.isValidate.value = false;
              } else {
                controller.isValidate.value = true;
              }
            },
            onInputValidated: (bool value) {
              print(value);
            },
            inputDecoration: const InputDecoration(
              border: InputBorder.none,
              filled: false,
              // icon: Icon(Icons.phone),
              hintText: 'Phone number ...',
              // labelText: 'Phone Number *',
            ),
            selectorConfig: SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              setSelectorButtonAsPrefixIcon: true,
              leadingPadding: 20,
              useEmoji: false,
            ),
            ignoreBlank: true,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: TextStyle(color: Colors.black),
            initialValue: controller.number,
            textFieldController: controller.textcontroller,
            formatInput: false,
            keyboardType:
                TextInputType.numberWithOptions(signed: true, decimal: true),
            inputBorder: InputBorder.none,
            onSaved: (PhoneNumber number) {
              print('On Saved: $number');
            },
          ),
        ),
        Obx(() {
          return !controller.isValidate.value
              ? Text('Invalidate PhoneNumber',
                  style: TextStyle(color: Colors.red))
              : SizedBox.shrink();
        })
      ],
    );
  }

  Widget _buildPinCode(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: PinCodeTextField(
        keyboardType: TextInputType.number,
        dialogConfig: DialogConfig(
            dialogContent: 'Hello',
            dialogTitle: 'Paste',
            negativeText: 'can',
            affirmativeText: 'ok'),
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          inactiveColor: Colors.blue,
          activeColor: Colors.blue,
          activeFillColor: Colors.greenAccent,
          inactiveFillColor: Colors.transparent,
          selectedFillColor: Colors.greenAccent,
          borderRadius: BorderRadius.circular(50),
        ),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        enableActiveFill: true,
        onCompleted: (v) {
          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },
        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
        appContext: context,
      ),
    );
  }

  _showEditNameSheet(Function(String) onSelect) {
    final TextEditingController textEditingController = TextEditingController();
    Get.bottomSheet(
      Container(
          height: 400,
          decoration: BoxDecoration(
              color: Colors.black,
              // borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              border: Border(
                top: BorderSide(
                  color: Colors.yellow,
                  width: 3.0,
                ),
              )),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  width: 30,
                  height: 3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    color: Colors.red,
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your username',
                        labelStyle: TextStyle(color: Colors.amber),
                        suffixIcon: IconButton(
                          onPressed: () => textEditingController.clear(),
                          icon: Icon(Icons.highlight_remove_sharp),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              OutlinedButton(onPressed: () => Get.back(), child: Text('Update'))
            ],
          )),
      barrierColor: Colors.transparent.withOpacity(0.5),
      elevation: 100,
      isDismissible: true,
    ).then((value) {
      onSelect.call(textEditingController.value.text);
    });
  }
}
