import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final String hinText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextAlign textAlign;
  final FormFieldValidator? validator;
  final EdgeInsetsGeometry contentPadding;
  final TextInputType? keyboardType;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final double? textFieldWidth;
  final double? textFieldHeight;
  final void Function()? onTap;
  InputBorder? customBorder;

  CustomTextField(
      {super.key,
      required this.hinText,
      required this.controller,
      this.suffixIcon,
      this.validator,
      this.contentPadding = const EdgeInsets.only(left: 15),
      this.keyboardType,
      this.maxLines,
      this.textOverflow,
      this.textFieldWidth,
      this.onTap,
      this.prefixIcon,
      this.customBorder,
      this.textAlign = TextAlign.left,
      this.textFieldHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: textFieldHeight,
      width: textFieldWidth,
      child: TextFormField(
          textAlign: textAlign,
          onTap: onTap,
          maxLines: maxLines,
          validator: validator,
          autofocus: false,
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: customBorder,
              errorBorder: customBorder,
              focusedBorder: customBorder,
              disabledBorder: customBorder,
              enabledBorder: customBorder,
              contentPadding: contentPadding,
              hintText: hinText,
              hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 13),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon)),
    );
  }
}


///Not In Use
// class CustomDropDown extends StatelessWidget {
//   CustomDropDown({
//     super.key,
//     this.dropDownWidth,
//     required this.dropDownMenuItems,
//     required this.onChanged,
//     required this.hintText,
//     this.validator,
//     this.borderRadius,
//     this.iconColor,
//     this.customBorder,
//     this.hintTextStyle,
//     this.dropDownHeight,
//     this.suffixIcon,
//   });
//
//   final double? dropDownWidth;
//   final double? dropDownHeight;
//   List<DropdownMenuItem> dropDownMenuItems;
//   final void Function(dynamic) onChanged;
//   final String hintText;
//   final String? Function(dynamic)? validator;
//   final BorderRadius? borderRadius;
//   final Color? iconColor;
//   final InputBorder? customBorder;
//   final TextStyle? hintTextStyle;
//   final Icon? suffixIcon;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: context.height / 20,
//       width: dropDownWidth,
//       child: DropdownButtonFormField(
//         iconSize: 16,
//           // style: hintTextStyle,
//           hint: Text(
//             hintText,
//             style: TextStyle(
//                 fontSize: 8,
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold),
//           ),
//           validator: validator,
//           borderRadius: borderRadius,
//           icon: Icon(
//             Icons.keyboard_arrow_down,
//             color: iconColor,
//             // size: 16,
//           ),
//           decoration: InputDecoration(
//               fillColor: kSecondaryColor,
//               filled: true,
//               border: customBorder,
//               errorBorder: customBorder,
//               focusedBorder: customBorder,
//               disabledBorder: customBorder,
//               enabledBorder: customBorder,
//               contentPadding: EdgeInsets.only(left: 7, right: 5),
//               // hintText: hintText,
//               hintStyle: hintTextStyle),
//           // dropdownColor: Colors.white,
//           items: dropDownMenuItems,
//           onChanged: onChanged),
//     );
//   }
// }
