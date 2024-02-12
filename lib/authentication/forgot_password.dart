import 'package:estacy/api/models/reset_password_model.dart';
import 'package:estacy/api/repository/user_repository.dart';
import 'package:estacy/authentication/signin.dart';
import 'package:estacy/constants/app_colors.dart';
import 'package:estacy/widgets/app_button.dart';
import 'package:estacy/widgets/app_text.dart';
import 'package:estacy/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:estacy/constants/app_colors.dart' as color;

class ForgotPassword extends StatefulWidget {
  ForgotPassword({
    super.key,
    required this.email,
    required this.savedOtp,
  });
  String email;
  String savedOtp;

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool passToggle = true;
  // final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  Map<String, dynamic> validators = {
    // 'email': null,
    'password': null,
    'confirm_password': null,
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
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // const Spacer(),
              // const SizedBox(
              //   height: 10,
              // ),
              Container(
                // alignment: Alignment.topRight,
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    child: SizedBox(
                      height: 20,
                      width: screenWidth * 0.20,
                      child: const Icon(
                        Icons.cancel_outlined,
                        color: color.AppColor.textColor,
                        size: 30,
                      ),
                    ),
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => VerifyPasswordOTP()));
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Spacer(),
              FittedBox(
                child: AppHeadingText(
                  text: 'Enter a new password & \nconfirm it',
                  fontSize: 25,
                  color: color.AppColor.textColor,
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
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
                        const SizedBox(
                          height: 15,
                        ),

                        //  password

                        AppTextField(
                          controller: _passwordController,
                          hintText: 'New Password',
                          errorText: validators['password'],
                          obscureText: passToggle,
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passToggle = !passToggle;
                              });
                            },
                            child: Icon(
                              passToggle
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: color.AppColor.textColor,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppTextField(
                          controller: _confirmPasswordController,
                          hintText: 'Confirm new Password',
                          // errorText: validators['password'],
                          obscureText: passToggle,
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passToggle = !passToggle;
                              });
                            },
                            child: Icon(
                              passToggle
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: color.AppColor.textColor,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        const SizedBox(
                          height: 5,
                        ),
                        // Terms and Conditions

                        const SizedBox(
                            // height: 10,
                            ),
                        // Spacer(),
                        AppButton(
                            buttonText: 'Reset password',
                            // buttonColor: color.AppColor.primaryColor,
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
                              _resetPassword();
                            }),

                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _resetPassword() async {
    String password = _passwordController.text.trim();
    ResetPasswordModel verifyPasswordReset = ResetPasswordModel(
      email: widget.email,
      otp: widget.savedOtp,
      password: password,
    );
    setState(() {
      for (var key in validators.keys) {
        validators[key] = null;
      }
    });
    UserRespository()
        .resetPassword(verifyPasswordReset.toJson())
        .then((response) async {
   
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => const SignIn()));
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
}
