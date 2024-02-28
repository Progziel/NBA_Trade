
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba/helper/color_assets.dart';
import 'package:nba/view/auth/login_screen.dart';
import 'package:nba/view/auth/registeration_screen.dart';

import '../../controllers/my_auth_controller.dart';
import '../../helper/my_dialog_helper.dart';


class MyAuthScreen extends StatefulWidget {
  const MyAuthScreen({super.key});

  @override
  State<MyAuthScreen> createState() => _MyAuthScreenState();
}

class _MyAuthScreenState extends State<MyAuthScreen> {
  final MyAuthController _controller = MyAuthController();

  @override
  void initState() {
    if (FirebaseAuth.instance.currentUser != null) {
      _controller.loadInitialData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAssets.primaryBackground,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorAssets.primary,
              ColorAssets.white
              // MyColorHelper.green1,
              // MyColorHelper.green3
            ], // Add your desired colors here
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: SizedBox(
                  height: 300,
                  child: Image.asset('assets/images/facebook-icon.png'),
                ),
              ),
            ),
            Center(
              child: Obx(() =>
              _controller.loading
                  ? MyDialogHelper.showLoadingDialog(context)
                  : _controller.auth
                  ? LoginScreen(controller: _controller)
                  : RegisterScreen(controller: _controller)),
            ),
          ],
        ),
      ),
    );
  }
}