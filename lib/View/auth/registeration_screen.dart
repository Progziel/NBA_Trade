import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba/controllers/my_auth_controller.dart';
import 'package:nba/models/my_user_model.dart';
import 'package:nba/view/auth/login_screen.dart';

import '../../helper/auth_header.dart';
import '../../helper/color_assets.dart';
import '../../helper/custom_button.dart';
import '../../helper/custom_social_icon.dart';
import '../../helper/custom_text.dart';
import '../../helper/custom_textformfield.dart';
import '../../helper/textfield_validator.dart';

class RegisterScreen extends StatefulWidget {
  final MyAuthController controller;
  const RegisterScreen({super.key, required this.controller});
  // final AuthController controller;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
 // final formKey = GlobalKey<FormState>();
  final address = TextEditingController();
  final fullName = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Form(
        key: RegisterScreen._formKey,
        child: Scaffold(
          backgroundColor: ColorAssets.primaryBackground,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const AuthHeader(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomTextWidget(
                        text: 'Create your Account',
                        maxLines: 2,
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                        textColor: ColorAssets.textSecondary,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          controller: fullName,
                          validator: (validator){
                            return AppValidator.validateEmptyText("Full Name",validator);

                          },
                        hint: 'Full Name',
                        hintTextColor: ColorAssets.primary.withOpacity(0.3),
                        prefixIcon: const Icon(
                          Icons.phone_android,
                          color: ColorAssets.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          controller: phone,
                          validator: (validator){
                            return AppValidator.validatePhoneNumber(validator);

                          },
                        hint: 'Phone No. ',
                        hintTextColor: ColorAssets.primary.withOpacity(0.3),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: ColorAssets.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          controller: address,
                          validator: (validator){
                            return AppValidator.validateEmptyText("Address",validator);

                          },
                        hint: 'Address',
                        hintTextColor: ColorAssets.primary.withOpacity(0.3),
                        prefixIcon: const Icon(
                          Icons.location_searching_sharp,
                          color: ColorAssets.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                         controller: email,
                         validator: (validator){
                           return AppValidator.validateEmail(validator);

                         },
                        hint: 'Email',
                        hintTextColor: ColorAssets.primary.withOpacity(0.3),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: ColorAssets.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        validator: (validator){
                        return  AppValidator.validatePassword(validator);

                        },
                        obscureText: true,
                        controller: password,
                        hint: 'Password',
                        hintTextColor: ColorAssets.primary.withOpacity(0.3),
                        prefixIcon: const Icon(
                          Icons.key,
                          color: ColorAssets.primary,
                        ),
                      ),
                      SizedBox(height: context.height * 0.04),
                       CustomButton(
                        showBackgroundColor: true,
                        buttonText: 'Register',
                        onTap: () async{
                          if(RegisterScreen._formKey.currentState!.validate()){
                MyUserModel userModel = MyUserModel(
                fullName: fullName.text,
                email: email.text,
                password: password.text,
                address: address.text,
                );
                await widget.controller.createUser(userModel);
                           // controller.registerUser();
                          }

                        },
                      ),
                      SizedBox(height: context.height * 0.01),
                      const CustomTextWidget(
                        text: 'Or Register with',
                        fontWeight: FontWeight.w600,
                        textColor: Colors.black87,
                      ),
                      SizedBox(height: context.height * 0.01),
                      const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomSocialIcon(
                                imagePath: 'assets/images/google-icon.png'),
                            CustomSocialIcon(
                                imagePath: 'assets/images/facebook-icon.png'),
                            // CustomSocialIcon(
                            //     imagePath: 'assets/images/apple-icon.png'),
                          ],
                        ),
                      ),
                      SizedBox(height: context.height * 0.01),
                      InkWell(
                        onTap: () => widget.controller.setAuth = true,
                        child: Text.rich(
                          TextSpan(
                            text: 'Already have an Account? ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: ColorAssets.textLightGrey,
                                fontSize: 12.0),
                            children: const [
                              TextSpan(
                                text: 'Login',
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
