import 'package:flutter/material.dart';
import 'package:flutter_skeleton/utils/app_colors.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 0,right: 10,top: 5,bottom: 5),
        child: const Icon(
          Icons.arrow_back_outlined,
          size: 24,
          color: AppColors.black,
        ),
      )
    );
  }
}
