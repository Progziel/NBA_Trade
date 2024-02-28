import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nba/helper/color_assets.dart';

class ToastMessage {
  static Future<bool?> showToastMessage(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorAssets.primaryBackground,
        textColor: Colors.black,
        fontSize: 16.0);
  }
}