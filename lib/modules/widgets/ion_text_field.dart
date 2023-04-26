import 'package:flutter/material.dart';

class IonTextField extends StatelessWidget {
  final Function(String value)? onChanged;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final bool autofocus;

  IonTextField(
      {this.autofocus = false,
      this.onChanged,
      this.focusNode,
      this.inputDecoration,
      this.keyboardType,
      this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        autofocus: autofocus,
        autovalidateMode: AutovalidateMode.disabled,
        focusNode: focusNode,
        onChanged: (String value) {
          print(value);
          onChanged?.call(value);
        },
        cursorColor: Colors.white,
        decoration: inputDecoration,
        controller: textEditingController,
        keyboardType: keyboardType,
      ),
    );
  }
}
