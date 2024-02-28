import 'package:flutter/material.dart';


class MyDialogHelper {
   static showLoadingDialog(BuildContext context, {bool light = false}) => AlertDialog(
     backgroundColor: light
         ? Colors.white.withOpacity(0.90)
         : Colors.grey,
     content: Column(
       mainAxisSize: MainAxisSize.min,
       children: <Widget>[
         CircularProgressIndicator(
           color: light ? Colors.blue.withOpacity(0.90) : Colors.white.withOpacity(0.90),
         ),
         const SizedBox(height: 8.0),
         Text(
           'Loading...',
           style: TextStyle(
             color: light ? Colors.blue.withOpacity(0.90) : Colors.white.withOpacity(0.90),
           ),
         ),
       ],
     ),
   );
}
