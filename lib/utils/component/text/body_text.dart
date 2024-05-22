import 'package:flutter/cupertino.dart';
import 'package:flutter_skeleton/utils/app_colors.dart';

class BodyText extends StatelessWidget {
  final String text;
  final Color? fontColor;

  const BodyText(
      {Key? key, required this.text, this.fontColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: fontColor ?? AppColors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400),
    );
  }
}
