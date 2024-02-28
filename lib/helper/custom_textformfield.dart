
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_assets.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String hint;
  final bool? obscureText;
  final int? maxLines;
  final Color? fillColor;
  final Color? hintTextColor;
  final Widget? sufixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  const CustomTextFormField(
      {Key? key,
        this.controller,
        this.prefixIcon,
        this.sufixIcon,
        this.fillColor,
        this.hintTextColor,
        this.validator,
        required this.hint,
        this.obscureText,
        this.onChanged,
        this.maxLines})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: hint,
          textColor: ColorAssets.primary,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        TextFormField(

          validator: validator,
          controller: controller,
          onChanged: onChanged,
          keyboardType: TextInputType.text,
          style: const TextStyle(color: Colors.black),
          obscureText: obscureText ?? false,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(

              contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
              hintText: 'Enter your $hint',
              hintStyle: TextStyle(
                  color: hintTextColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0),
              filled: true,
              fillColor: fillColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: ColorAssets.primary,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: ColorAssets.primary,
                  width: 2.0,
                ),
              ),
              prefixIcon: prefixIcon,
              //focusedBorder: InputBorder.none,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: sufixIcon),
        ),
      ],
    );
    // return TextFormField(
    //   obscureText: obscureText,
    //   controllers: controllers,
    //   decoration: InputDecoration(
    //     enabledBorder: OutlineInputBorder(
    //       borderSide: const BorderSide(
    //         color: Colors.black38,
    //       ),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     errorBorder: OutlineInputBorder(
    //       borderSide:
    //           const BorderSide(color: AppAssets.primaryColor, width: 0.5),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderSide: const BorderSide(color: Colors.black, width: 0.5),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     hintText: hintText,
    //     hintStyle: const TextStyle(color: Colors.black54, fontSize: 15),
    //     // label: CustomTextWidget(text: label ),
    //     //labelStyle: const TextStyle(color: Colors.black, fontSize: 15),
    //   ),
    //   validator: validator,
    // );
  }
}