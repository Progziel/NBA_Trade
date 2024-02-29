import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_trade/Controllers/universal_controller.dart';
import 'package:nba_trade/View/Team%20Selection/team_selection.dart';

import 'Controllers/dashboard_controller.dart';
import 'View/Dashboard/dashboard.dart';


void main() {
  runApp(const MyApp());

  Get.put(DashboardController());
  Get.put(UniversalController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: Dashboard());
  }
}
