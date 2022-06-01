import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomElevatedButton extends StatelessWidget {
  String button_text;
  Color? button_color;
  Function onPressing;
  CustomElevatedButton({Key? key, required this.button_text, this.button_color, required this.onPressing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {onPressing()},
        child: Text(button_text.toUpperCase(), style: TextStyle(color: Colors.white),),
        style: ElevatedButton.styleFrom(
            primary: button_color,
            padding: EdgeInsets.symmetric(horizontal: 30),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))));
  }
}
