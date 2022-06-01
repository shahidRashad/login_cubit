import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomtextField extends StatelessWidget {
  String data;
  double? font_size;
  Color? font_color;
  FontWeight? weight;
  CustomtextField({Key? key, required this.data, this.font_color, this.font_size, this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(data,
    style: TextStyle(
      color: font_color,
      fontSize: font_size,
      fontWeight: weight
    ),);
  }
}