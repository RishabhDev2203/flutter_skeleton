import 'package:flutter/cupertino.dart';
import 'package:flutter_skeleton/utils/app_colors.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final Color? fontColor;

  const TextTitle(
      {Key? key, required this.text, this.fontColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: fontColor ?? AppColors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500),
    );
  }
}
