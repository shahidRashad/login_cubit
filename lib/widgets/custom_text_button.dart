import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextButton extends StatelessWidget {
  Widget widget;
  Function onPress;

  CustomTextButton({Key? key, required this.widget, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {onPress()}, 
      child: widget,
    );
  }
}