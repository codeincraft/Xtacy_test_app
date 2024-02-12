import 'dart:ui';
import 'package:estacy/api/models/verify_password_reset.dart';
import 'package:estacy/api/repository/user_repository.dart';
import 'package:estacy/authentication/forgot_password.dart';
import 'package:estacy/constants/app_colors.dart';
import 'package:estacy/widgets/app_button.dart';
import 'package:estacy/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:estacy/constants/app_colors.dart' as color;

class VerifyPasswordOTP extends StatefulWidget {
  VerifyPasswordOTP({super.key, required this.email});
  String email;

  @override
  State<VerifyPasswordOTP> createState() => _VerifyPasswordOTPState();
}

class _VerifyPasswordOTPState extends State<VerifyPasswordOTP> {
  bool passToggle = true;
  final formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  final _oneController = TextEditingController();
  final _twoController = TextEditingController();
  final _threeController = TextEditingController();
  final _fourController = TextEditingController();
  final _fiveController = TextEditingController();
  final _sixController = TextEditingController();

  Map<String, dynamic> validators = {
    'one': null,
    'two': null,
    'three': null,
    'four': null,
    'five': null,
    'six': null,
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                                height: 20,
                              ),
                              FittedBox(
                                child: AppContentText(
                                  text: 'Please enter the OTP that was sent to',
                                  fontWeight: FontWeight.w600,
                                  // size: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              // Otp
                              FittedBox(
                                child: AppContentText(
                                  text: 'Enter OTP sent to ur email',
                                  fontWeight: FontWeight.w600,
                                  // size: 20,
                                ),
                              ),
                              Container(
                                height: 70,
                                width: screenWidth,
                                decoration: const BoxDecoration(
                                    // color: color.AppColor.primaryColor,
                                    // borderRadius: BorderRadius.circular(5),
                                    ),
                                // Change pin
                                child: Form(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        width: 45,
                                        child: TextFormField(
                                          controller: _oneController,
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: AppColor.textFieldColor,
                                            hintText: '0',
                                            errorText: validators['one'],
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 217, 217, 217),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color(0xff585656),
                                              ),
                                            ),
                                          ),
                                          obscureText: true,
                                          onSaved: (Pin1) {},
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        height: 60,
                                        width: 45,
                                        child: TextFormField(
                                          controller: _twoController,
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: AppColor.textFieldColor,
                                            hintText: '0',
                                            errorText: validators['two'],
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 217, 217, 217),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color(0xff585656),
                                              ),
                                            ),
                                          ),
                                          obscureText: true,
                                          onSaved: (Pin1) {},
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      // three
                                      SizedBox(
                                        height: 60,
                                        width: 45,
                                        child: TextFormField(
                                          controller: _threeController,
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: AppColor.textFieldColor,
                                            hintText: '0',
                                            errorText: validators['three'],
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 217, 217, 217),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color(0xff585656),
                                              ),
                                            ),
                                          ),
                                          obscureText: true,
                                          onSaved: (Pin1) {},
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      FittedBox(
                                        child: AppContentText(text: '-'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      // four
                                      SizedBox(
                                        height: 60,
                                        width: 45,
                                        child: TextFormField(
                                          controller: _fourController,
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: AppColor.textFieldColor,
                                            hintText: '0',
                                            errorText: validators['four'],
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 217, 217, 217),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color(0xff585656),
                                              ),
                                            ),
                                          ),
                                          obscureText: true,
                                          onSaved: (Pin1) {},
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      // five
                                      SizedBox(
                                        height: 60,
                                        width: 45,
                                        child: TextFormField(
                                          controller: _fiveController,
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: AppColor.textFieldColor,
                                            hintText: '0',
                                            errorText: validators['five'],
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 217, 217, 217),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color(0xff585656),
                                              ),
                                            ),
                                          ),
                                          obscureText: true,
                                          onSaved: (Pin1) {},
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      // six
                                      SizedBox(
                                        height: 60,
                                        width: 45,
                                        child: TextFormField(
                                          controller: _sixController,
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: AppColor.textFieldColor,
                                            hintText: '0',
                                            errorText: validators['six'],
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 217, 217, 217),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color(0xff585656),
                                              ),
                                            ),
                                          ),
                                          obscureText: true,
                                          onSaved: (Pin1) {},
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                                  buttonText: 'Verify OTP',
                                  gradientColor: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        AppColor.gradientButtonColor1,
                                        AppColor.gradientButtonColor1,
                                        AppColor.gradientButtonColor1,
                                        AppColor.gradientButtonColor2
                                      ]),
                                  borderRadius: 8,
                                  height: 40,
                                  fontsize: 18,
                                  fontWeight: FontWeight.bold,
                                  textColor: Colors.white,
                                  onTap: () {
                                    _resetPasswordOtp();
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

  Future<void> _resetPasswordOtp() async {
    String one = _oneController.text.trim();
    String two = _twoController.text.trim();
    String three = _threeController.text.trim();
    String four = _fourController.text.trim();
    String five = _fiveController.text.trim();
    String six = _sixController.text.trim();

    var otpValues = one + two + three + four + five + six;
    VerifyPasswordReset verifyPasswordReset = VerifyPasswordReset(
      email: widget.email,
      otp: otpValues,
    );
    setState(() {
      for (var key in validators.keys) {
        validators[key] = null;
      }
    });
    UserRespository()
        .verifyPasswordReset(verifyPasswordReset.toJson())
        .then((response) async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (builder) => ForgotPassword(
            email: widget.email,
            savedOtp: otpValues,
          ),
        ),
      );
    }).catchError((error) {
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
