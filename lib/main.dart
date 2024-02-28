import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/dashboard_controller.dart';
import 'View/Dashboard/dashboard.dart';


void main() {
  runApp(const MyApp());

  Get.put(DashboardController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: Dashboard());
  }
}
