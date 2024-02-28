import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nba/controllers/my_auth_controller.dart';

import '../../helper/auth_header.dart';
import '../../helper/color_assets.dart';
import '../../helper/custom_button.dart';
import '../../helper/custom_text.dart';
import '../../helper/custom_textformfield.dart';

class ForgetPasswordScreen extends StatefulWidget {
  final MyAuthController controller;
  const ForgetPasswordScreen({super.key, required this.controller});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorAssets.primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const AuthHeader(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextWidget(text: '🔒'),
                        SizedBox(width: 5.0),
                        CustomTextWidget(
                          text: 'Forgot Your Password?',
                          maxLines: 2,
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          textColor: ColorAssets.textSecondary,
                        ),
                      ],
                    ),
                    SizedBox(height: context.height * 0.03),
                    const CustomTextWidget(
                      text:
                          'Please enter your registered email address, and we\'ll send you a link to reset your password.',
                      maxLines: 3,
                      fontSize: 14.0,
                      textAlign: TextAlign.center,
                      fontStyle: FontStyle.italic,
                      textColor: ColorAssets.textSecondary,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      hint: 'Email',
                      hintTextColor: ColorAssets.primary.withOpacity(0.3),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: ColorAssets.primary,
                      ),
                    ),
                    SizedBox(height: context.height * 0.05),
                    CustomButton(
                      showBackgroundColor: true,
                      buttonText: 'Reset',
                      onTap: () async {
                        log(emailController.text);
                        await widget.controller.sendPasswordResetEmail(
                            email: emailController.text.trim(),
                            toastMessage: "Verification Email has been sent.");
                      },
                    ),
                    Obx(() => Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: widget.controller.resendPassTimer.value ? null : () async {
                            widget.controller.resendPassTimer.value = true;
                            await widget.controller.sendPasswordResetEmail(
                                email: emailController.text,
                                toastMessage: "Reset Password link has been sent to your email.");
                            log(emailController.text);
                            const oneSec = Duration(seconds: 1);
                            timer = Timer.periodic(oneSec, (timer) {
                              if (widget.controller.start.value == 0) {
                                timer.cancel();
                                widget.controller.resendPassTimer.value = false;
                                widget.controller.start.value == 30;
                              } else {
                                widget.controller.start.value--;
                              }
                            });
                          },
                          child: widget.controller.resendPassTimer.value == false
                              ? const CustomTextWidget(
                            text: 'Resend email verification',
                            textColor: ColorAssets.primary,
                            fontWeight: FontWeight.w500,
                          ) : CustomTextWidget(
                                text: "Resend in ${widget.controller.start.value.toString()}",
                                textColor: ColorAssets.primary,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),),
                    SizedBox(
                      height: Get.height * 0.06,
                    ),
                    const CustomTextWidget(
                      text: 'Need further assistance? \nContact [Support Email/Phone]. \nGet back into the NBA trade action! 🚀🏀',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      fontStyle: FontStyle.italic,
                      fontSize: 14.0,
                      textColor: Colors.black54,
                    ),
                    SizedBox(height: context.height * 0.09),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
