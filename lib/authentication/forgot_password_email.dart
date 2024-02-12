import 'dart:ui';

import 'package:estacy/api/models/resetpassword_email.dart';
import 'package:estacy/api/repository/user_repository.dart';
import 'package:estacy/authentication/verify_password_otp.dart';
import 'package:estacy/constants/app_colors.dart';
import 'package:estacy/widgets/app_button.dart';
import 'package:estacy/widgets/app_text.dart';
import 'package:estacy/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:estacy/constants/app_colors.dart' as color;

class ForgotPasswordEmail extends StatefulWidget {
  const ForgotPasswordEmail({super.key});

  @override
  State<ForgotPasswordEmail> createState() => _ForgotPasswordEmailState();
}

class _ForgotPasswordEmailState extends State<ForgotPasswordEmail> {
  bool passToggle = true;
  final _emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  Map<String, dynamic> validators = {
    'email': null,
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: color.AppColor.background,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
                top: -20,
                right: -100,
                child: Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primaryColor.withOpacity(0.6),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 100,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                )),
            Positioned(
                top: -30,
                right: -100,
                child: Container(
                  width: 150,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.textColor.withOpacity(0.9),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 80,
                      sigmaY: 100,
                    ),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.transparent,
                    ),
                  ),
                )),
            Container(
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      // color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: AssetImage('assets/Rectangle 25.png'),
                          fit: BoxFit.contain),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppContentText(text: 'Welcome Back, Tolu'),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: AppHeadingText(
                            text: 'Welcome Back',
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Email
                              AppContentText(
                                text: 'Email recovery email',
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              AppTextField(
                                controller: _emailController,
                                hintText: 'Enter Email address',
                                errorText: validators['email'],
                                obscureText: false,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              const SizedBox(
                                height: 5,
                              ),
                              const SizedBox(
                                  // height: 10,
                                  ),
                              // Spacer(),
                              AppButton(
                                  buttonText: 'Login',
                                  gradientColor: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        AppColor.gradientButtonColor1,
                                        AppColor.gradientButtonColor1,
                                        AppColor.gradientButtonColor1,
                                        AppColor.gradientButtonColor2
                                      ]),
                                  // color.AppColor.appBackgroundColor2,
                                  borderRadius: 8,
                                  height: 40,
                                  fontsize: 18,
                                  fontWeight: FontWeight.bold,
                                  textColor: Colors.white,
                                  // color.AppColor.textColor3,
                                  onTap: () {
                                    _resetPasswordEmail();
                                  }),

                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _resetPasswordEmail() async {
    // await UserService().removeStorage();
    String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();
    // String email = otpValues;
    ResetPasswordEmail resetPasswordEmail = ResetPasswordEmail(email: email);
    setState(() {
      for (var key in validators.keys) {
        validators[key] = null;
      }
    });
    UserRespository()
        .resetPasswordEmail(resetPasswordEmail.toJson())
        .then((response) async {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          // setState(() {

          // });
        },
      );
      // print('$otpValues');
      print(response);
      // login successful
      // await setUserLocation();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (builder) => VerifyPasswordOTP(
                    email: email,
                  )));
    }).catchError((error) {
      print(error);
      var errorMessage = '';
      if (error is Map) {
        if (error.containsKey('status')) {
          if (error['status'] == 500) {
            errorMessage = error['error'];
          }
        } else if (error.containsKey('message')) {
          errorMessage = error['message'];
        }
      } else {
        errorMessage = error;
      }
      EasyLoading.showError(errorMessage.toString());
    });
  }
//  
}
