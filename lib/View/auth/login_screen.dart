import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba/controllers/my_auth_controller.dart';
import 'package:nba/view/auth/forget_password_screen.dart';
import 'package:nba/view/auth/registeration_screen.dart';
import '../../helper/auth_header.dart';
import '../../helper/color_assets.dart';
import '../../helper/custom_button.dart';
import '../../helper/custom_social_icon.dart';
import '../../helper/custom_text.dart';
import '../../helper/custom_textformfield.dart';
import '../../helper/textfield_validator.dart';

class LoginScreen extends StatefulWidget {
  final MyAuthController controller;
  const LoginScreen({super.key, required this.controller});
  // final AuthController controller;

  static final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorAssets.primaryBackground,
        body: SingleChildScrollView(
          child: Form(
             key: LoginScreen._formKey1,
            child: Column(
              children: [
                const AuthHeader(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  child: Column(
                    children: [
                      const CustomTextWidget(
                        text: 'Log in to your account.',
                        maxLines: 2,
                        fontStyle: FontStyle.italic,
                        fontSize: 14.0,
                        textColor: ColorAssets.textSecondary,
                      ),
                      CustomTextFormField(
                        controller: emailController,
                        hint: 'Email',
                        validator: (validator) {
                          return AppValidator.validateEmail(validator);
                        },
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: ColorAssets.primary,
                        ),
                        hintTextColor: ColorAssets.primary.withOpacity(0.3),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        controller: passwordController,
                        obscureText: true,
                        validator: (validator) {
                          return AppValidator.validatePassword(
                              validator);
                        },
                        hint: 'Password',
                        hintTextColor: ColorAssets.primary.withOpacity(0.3),
                        prefixIcon: const Icon(
                          Icons.key,
                          color: ColorAssets.primary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: OpenContainer(
                            transitionType: ContainerTransitionType.fade,
                            transitionDuration: const Duration(seconds: 1),
                            openBuilder: (context, _) =>
                                 ForgetPasswordScreen(
                                  controller: widget.controller
                                ),
                            closedElevation: 0,
                            closedColor: Colors.transparent,
                            closedBuilder: (context, _) =>
                                const CustomTextWidget(
                              text: 'Forget Password?',
                              maxLines: 1,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              textColor: ColorAssets.primary,
                            ),
                          ),
                        ),
                      ),
                      CustomButton(
                        showBackgroundColor: true,
                        buttonText: 'Login',
                        onTap: () async {
                          if (LoginScreen._formKey1.currentState!.validate()) {
                            await widget.controller.loginUser(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                          print("onTap");

                        },
                      ),
                      SizedBox(height: context.height * 0.02),
                      const Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0, right: 8.0),
                            child: CustomTextWidget(
                              text: 'OR LOGIN WITH',
                              fontWeight: FontWeight.w600,
                              textColor: Colors.black87,
                            ),
                          ),
                          Expanded(child: Divider())
                        ],
                      ),
                      SizedBox(height: context.height * 0.02),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomSocialIcon(
                                onTap: () {
                                  //   controller.loginWithGoogle();
                                },
                                imagePath: 'assets/images/google-icon.png'),
                            const CustomSocialIcon(
                                imagePath: 'assets/images/facebook-icon.png'),
                            // const CustomSocialIcon(
                            //     imagePath: 'assets/images/apple-icon.png'),
                          ],
                        ),
                      ),
                      SizedBox(height: context.height * 0.01),
                      InkWell(
                        onTap: () => widget.controller.setAuth = false,
                        child: Text.rich(
                          TextSpan(
                            text: 'Don\'t have an Account? ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: ColorAssets.textLightGrey,
                                fontSize: 12.0),
                            children: const [
                              TextSpan(
                                text: 'Register',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: ColorAssets.textPrimary,
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
