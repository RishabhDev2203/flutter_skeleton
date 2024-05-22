import 'package:flutter/material.dart';

class AppColors {

  //screen colors
  static const header = Color(0xFF211340);
  static const primaryColor = Color(0xFF1F113E);
  static const primaryDarkColor = Color(0xFF2C1A53);
  static const bgColor = Color(0xFF2C1A53);
  static const secondaryBgColor = Color(0xFF33344E);

  //text colors
  static const textGreenColor = Color(0xFF32FF9C);
  static const textDarkGreenColor = Color(0xFF1D8E57);
  static const textPlaceHolder = Color(0xFF8F959D);
  static const textPrimaryColor = Color(0xFF0F1627);
  static const textSecondaryColor = Color(0xFF6C7076);
  static const textThirdColor = Color(0xFF8F959D);
  static const textLiveColor = Color(0xFFF1F3F6);
  static const textSixthColor = Color(0xFF6D747B);
  static const textLinkColor = Color(0xFF285CFF);

  //container colors
  static const containerColor = Color(0x29E7E9F1);
  static const thirdContainerColor = Color(0x723D3E5A);
  static const fourthContainerColor = Color(0xFF22262E);
  static const secondarycontainerColor = Color(0xFF1A1B2F);

  //divider colors
  static const dividerColor = Color(0xFF443E60);
  static const dividerSecondaryColor = Color(0xFFE5E5EA);
  static const borderColor = Color(0xFFE6EBF1);
  static const borderSecondaryColor = Color(0xFFD6DCE3);

  //icon color
  static const blurIconColor = Color(0x29E7E9F1);

  //common colors
  static const transparent = Colors.transparent;
  static const whiteColor = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const yellowColor = Color(0xFFFCA84C);
  static const textOrangeColor = Color(0xFFFCA84C);
  static const errorColor = Color(0xFFF4603F);

  //shimmer colors
  static const shimmerBase = Color(0x723D3E5A);
  static const shimmerAnim = Color(0xFFD5D7EA);
  static const neutralDotColor = Color(0xFF3CE0EC);


  //gradient colors

  static buttonGradient() {
    return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF65FFDE), Color(0xFF1690D1)]
        );
  }

  static cordGradient() {
    return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0x72383954), Color(0x72393A55
        )]
    );
  }
  static tabGradient() {
    return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF65FFDE
        ), Color(0xFF1690D1
        )]
    );
  }


  static bgGradientBoxDecoration() {
    return  const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [-1,0.6],
          colors: [Color(0xFF33344E),Color(0xFF18182F)]
      ),
    );
  }

  static buttonGradientLight() {
    return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFE0FFF8), Color(0xFFD0E9F6)]);
  }

  static Widget gradientOverlay(double h, double w, double cornerRadius) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [-1, 0.2,0.7],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.transparent,
            Colors.transparent,
            Colors.black.withOpacity(0.8),
          ],
        ),
      ),
    );
  }
}
