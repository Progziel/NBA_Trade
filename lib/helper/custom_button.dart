import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba/helper/custom_text.dart';

import 'color_assets.dart';
class CustomButton extends StatelessWidget {
  final String buttonText;
  final double? width;
  final bool showBackgroundColor;
  final void Function()? onTap;
  const CustomButton(
      {super.key,
        required this.buttonText,
        this.onTap,
        this.width,
        required this.showBackgroundColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 50,
          width: width ?? Get.width,
          decoration: BoxDecoration(
              color: showBackgroundColor
                  ? ColorAssets.primary
                  : Colors.white,
              border: Border.all(
                  width: 2.0,
                  color: showBackgroundColor
                      ? Colors.transparent
                      : ColorAssets.primary),
              borderRadius: BorderRadius.circular(30)),
          child: Center(
              child: CustomTextWidget(
                text: buttonText,
                textColor: showBackgroundColor ? ColorAssets.white : ColorAssets.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ))),
    );
  }
}