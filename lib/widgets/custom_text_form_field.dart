import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextFormField extends StatelessWidget {
  String? label;
  String? hint;
  Color? text_color;
  TextInputType? keyboardType;
  TextEditingController? controller;
  FormFieldValidator<String>? validate;
  bool obsecure;
  CustomTextFormField({Key? key,  this.controller, this.hint, this.label, this.keyboardType, this.text_color, this.validate, this.obsecure=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      controller: controller!,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
      ),
      keyboardType: keyboardType,
      obscureText: obsecure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(color: text_color),
    );
  }
}