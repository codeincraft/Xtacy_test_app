import 'dart:ui';
import 'package:estacy/api/models/register_model.dart';
import 'package:estacy/api/repository/user_repository.dart';
import 'package:estacy/authentication/signin.dart';
import 'package:estacy/authentication/verify_email.dart';
import 'package:estacy/constants/app_colors.dart';
import 'package:estacy/services/user_services.dart';
import 'package:estacy/widgets/app_button.dart';
import 'package:estacy/widgets/app_text.dart';
import 'package:estacy/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:estacy/constants/app_colors.dart' as color;

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool passToggle = true;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _referalCodeController = TextEditingController();

  Map<String, dynamic> validators = {
    'first_name': null,
    'last_name': null,
    'email': null,
    'password': null,
    'phone': null,
  };

  final formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  final LinearGradient _gradient = const LinearGradient(colors: <Color>[
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
              child: Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                          width: screenWidth,
                          child: Row(
                            children: [
                              // BackButton
                              InkWell(
                                child: SizedBox(
                                  height: 20,
                                  width: screenWidth * 0.20,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: color.AppColor.textColor,
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: AppContentText(
                                          text: 'Back',
                                          size: 15,
                                          color: color.AppColor.textColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {},
                              ),
                              const Spacer(),
                              InkWell(
                                child: ShaderMask(
                                  shaderCallback: (Rect rect) {
                                    return _gradient.createShader(rect);
                                  },
                                  child: Text(
                                    'Sign in instead',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                            fontSize: 12,
                                            fontFamily: 'AeonikTRIAL-Light.otf',
                                            color: Colors.white,
                                            decoration:
                                                TextDecoration.underline),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SignIn(),
                                      ));
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: AppHeadingText(
                            text: 'Create an account',
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: color.AppColor.textColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: screenHeight * 0.12,
                                    width: screenWidth * 0.40,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppContentText(text: 'First name'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Expanded(
                                          child: AppTextField(
                                            controller: _firstNameController,
                                            hintText: 'First name',
                                            errorText: validators['first_name'],
                                            obscureText: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.12,
                                    width: screenWidth * 0.40,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppContentText(text: 'Last name'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Expanded(
                                          child: AppTextField(
                                            controller: _lastNameController,
                                            hintText: 'Last name',
                                            errorText: validators['last_name'],
                                            obscureText: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AppContentText(text: 'Phone number'),
                              const SizedBox(
                                height: 05,
                              ),
                              AppTextField(
                                controller: _phoneController,
                                hintText: 'Enter Phone number',
                                errorText: validators['phone'],
                                obscureText: false,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AppContentText(text: 'Email address'),
                              const SizedBox(
                                height: 05,
                              ),
                              AppTextField(
                                controller: _emailController,
                                hintText: 'Email',
                                errorText: validators['email'],
                                obscureText: false,
                                // suffixIcon: InkWell(
                                //   onTap: () {
                                //     setState(() {
                                //       passToggle = !passToggle;
                                //     });
                                //   },
                                //   child: Icon(
                                //     passToggle
                                //         ? Icons.visibility_off
                                //         : Icons.visibility,
                                //     color: color.AppColor.textColor,
                                //     size: 15,
                                //   ),
                                // ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AppContentText(text: 'Create Password'),
                              const SizedBox(
                                height: 05,
                              ),
                              //  password
                              AppTextField(
                                controller: _passwordController,
                                hintText: 'Enter Password',
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
                              AppContentText(text: 'Referral Code (Optional)'),
                              const SizedBox(
                                height: 05,
                              ),
                              AppTextField(
                                controller: _referalCodeController,
                                hintText: 'Referral Code',
                                // errorText: validators['email'],
                                obscureText: false,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // Spacer(),
                              AppButton(
                                  buttonText: 'Next',
                                  gradientColor: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        AppColor.gradientButtonColor1,
                                        AppColor.gradientButtonColor1,
                                        AppColor.gradientButtonColor1,
                                        AppColor.gradientButtonColor2
                                      ]),
                                  // buttonColor: color.AppColor.primaryColor,
                                  // color.AppColor.appBackgroundColor2,
                                  borderRadius: 8,
                                  height: 40,
                                  fontsize: 15,
                                  fontWeight: FontWeight.bold,
                                  textColor: Colors.white,
                                  // color.AppColor.textColor3,
                                  onTap: () {
                                    _registration();
                                    // Navigator.pushReplacement(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (Builder) => VerifyEmail(),
                                    //   ),
                                    // );
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 3,
                                  // width: screenWidth,
                                  color: color.AppColor.textColor,
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Expanded(
                                child: Container(
                                  height: 3,
                                  // width: screenWidth,
                                  color: color.AppColor.textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppContentText(
                          text: 'Account information',
                          // color: Colors.black,
                          // color: color.AppColor.textColor3,
                          // fontWeight: FontWeight.w500,
                          size: 13,
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

  Future<void> _registration() async {
    await UserService().removeStorage();

    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String phone = _phoneController.text.trim();

    Register register = Register(
      first_name: firstName,
      last_name: lastName,
      email: email,
      password: password,
      phone: phone,
    );
    // clear errors
    setState(() {
      for (var key in validators.keys) {
        validators[key] = null;
      }
    });
    UserRespository().register(register.toJson()).then((response) {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          // setState(() {

          // });
        },
      );
      print(response);
      print('success');
      print('email is');
      print(response['data']['user']['email']);
      // return;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (builder) =>
                  VerifyEmail(email: response['data']['user']['email'])));
    }).catchError((error) {
      print(error);
      // hide loader
      // alert user of error
      var errorMessage = '';
      if (error is Map) {
        if (error.containsKey('status')) {
          if (error['status'] == 500) {
            errorMessage = error['error'];
          }
        } else if (error.containsKey('data')) {
          errorMessage = error['data'];
        }
      } else {
        errorMessage = error;
        print(error['message']);
        EasyLoading.showError(error.toString());
      }
    });
  }
}
