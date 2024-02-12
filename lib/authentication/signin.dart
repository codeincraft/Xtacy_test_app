import 'dart:ui';

import 'package:estacy/api/models/login.dart';
import 'package:estacy/api/repository/user_repository.dart';
import 'package:estacy/authentication/create_account.dart';
import 'package:estacy/authentication/forgot_password_email.dart';
import 'package:estacy/constants/app_colors.dart';
import 'package:estacy/home/bottom_nav_widget.dart';
import 'package:estacy/services/user_services.dart';
import 'package:estacy/widgets/app_button.dart';
import 'package:estacy/widgets/app_text.dart';
import 'package:estacy/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:estacy/constants/app_colors.dart' as color;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool passToggle = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  Map<String, dynamic> validators = {
    'email': null,
    'password': null,
  };

   final LinearGradient _gradient = const LinearGradient(
    colors: <Color>[
        AppColor.gradientButtonColor1,
        AppColor.gradientButtonColor2
    ]);

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
            SafeArea(
              child: SizedBox(
                child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: SizedBox(
                    height: screenHeight,
                    width: screenWidth,
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
                        Container(
                          height: screenHeight * 0.08,
                          width: screenWidth * 0.70,
                          decoration: const BoxDecoration(
                            // color: Colors.amber,
                            borderRadius:
                                BorderRadius.only(bottomLeft: Radius.circular(20)),
                            image: DecorationImage(
                              image: AssetImage('assets/Welcome back 👋🏾.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Email
                                    AppContentText(
                                      text: 'Email address',
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
              
                                    //  password
                                    AppContentText(
                                      text: 'Password',
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    AppTextField(
                                      controller: _passwordController,
                                      hintText: ' Enter Password',
                                      errorText: validators['password'],
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
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (Builder) =>
                                                   const ForgotPasswordEmail() ,
                                              ),
                                            );
                                          },
                                          child: AppContentText(
                                            text: 'Forgot password?',
                                            color: color.AppColor.textColor,
                                          )),
                                    ),
                                    const SizedBox(
                                        // height: 10,
                                        ),
                                    // Spacer(),
                                    AppButton(
                                        buttonText: 'Sign in',
                                        buttonColor: color.AppColor.primaryColor,
                                        // color.AppColor.appBackgroundColor2,
                                        borderRadius: 8,
                                        height: 40,
                                        fontsize: 18,
                                        fontWeight: FontWeight.bold,
                                        textColor: Colors.white,
                                        gradientColor: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              AppColor.gradientButtonColor1,
                                              AppColor.gradientButtonColor1,
                                              AppColor.gradientButtonColor1,
                                              AppColor.gradientButtonColor2
                                            ]),
                                        // color.AppColor.textColor3,
                                        onTap: () {
              
                                            _login();
                                          // Navigator.pushReplacement(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (builder) => BottomNavigationBarScreen(),
                                          //   ),
                                          // );
                                          // _login();
                                        }),
              
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        AppContentText(
                                          text: 'Do not have an acoount?',
                                          // color: Colors.black,
                                          color: color.AppColor.textColor,
                                          // fontWeight: FontWeight.w500,
                                          size: 13,
                                        ),
                                        const SizedBox(width: 6,),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (Builder) => const CreateAccount(),
                                              ),
                                            );
                                          },
                                          child:  ShaderMask(
                                      shaderCallback: (Rect rect){
                                        return _gradient.createShader(rect);
                                      },
                                      child: Text('Create account',
                                      style: Theme.of(context).textTheme.headline4!.copyWith(
                                        fontSize: 12,
                                        fontFamily: 'AeonikTRIAL-Light.otf',
                                        color: Colors.white,
                                        decoration: TextDecoration.underline
                                      ),
                                      ),
                                    ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 40,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _login() async {
    await UserService().removeStorage();

    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    LoginUser loginUser = LoginUser(
        email: email,
        password: password,
        fcm_token: ''
         );
    // clear errors
    setState(() {
      for (var key in validators.keys) {
        validators[key] = null;
      }
    });
    UserRespository().login(loginUser.toJson()).then((response) async {
        Future.delayed(
        const Duration(seconds: 3),
        () {
          setState(() {

          });
        },
      );

      // login successful

      UserService().setToken(response['data']['token']);

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (builder) =>  const BottomNavScreen()));
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
