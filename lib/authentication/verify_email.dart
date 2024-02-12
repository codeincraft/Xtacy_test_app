import 'dart:ui';

import 'package:estacy/api/models/verify_otp_model.dart';
import 'package:estacy/api/repository/user_repository.dart';
import 'package:estacy/authentication/account_creation_successful.dart';
import 'package:estacy/constants/app_colors.dart';
import 'package:estacy/services/user_services.dart';
import 'package:estacy/widgets/app_button.dart';
import 'package:estacy/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:estacy/constants/app_colors.dart' as color;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class VerifyEmail extends StatefulWidget {
  VerifyEmail({super.key, required this.email});
  String email;

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final _1Controller = TextEditingController();
  final _2Controller = TextEditingController();
  final _3Controller = TextEditingController();
  final _4Controller = TextEditingController();
  final _5Controller = TextEditingController();
  final _6Controller = TextEditingController();

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.background,
      extendBody: true,
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
              // backgroundColor: color.AppColor.background,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                  AppContentText(
                                    text: 'Back',
                                    size: 15,
                                    color: color.AppColor.textColor,
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    FittedBox(
                      child: AppHeadingText(
                        text: 'Verify your email',
                        color: color.AppColor.textColor,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FittedBox(
                      child: AppContentText(
                        text: 'Please enter the OTP sent to',
                        // fontWeight: FontWeight.w600,
                        color: AppColor.textColor,
                        size: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FittedBox(
                      child: AppContentText(
                        text: widget.email,
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
                    // Pin Container
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
                                controller: _1Controller,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: '0',
                                  errorText: validators['one'],
                                  filled: true,
                                  fillColor: AppColor.textFieldColor,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 217, 217, 217),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xff585656),
                                    ),
                                  ),
                                ),
                                obscureText: true,
                                onSaved: (Pin1) {},
                                style: Theme.of(context).textTheme.headline6,
                                cursorColor: Colors.white,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
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
                                controller: _2Controller,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColor.textFieldColor,
                                   errorText: validators['two'],
                                  hintText: '0',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 217, 217, 217),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xff585656),
                                    ),
                                  ),
                                ),
                                obscureText: true,
                                onSaved: (Pin1) {},
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
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
                                controller: _3Controller,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColor.textFieldColor,
                                   errorText: validators['three'],
                                  hintText: '0',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 217, 217, 217),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xff585656),
                                    ),
                                  ),
                                ),
                                obscureText: true,
                                onSaved: (Pin1) {},
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
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
                                controller: _4Controller,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColor.textFieldColor,
                                  hintText: '0',
                                   errorText: validators['four'],
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 217, 217, 217),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xff585656),
                                    ),
                                  ),
                                ),
                                obscureText: true,
                                onSaved: (Pin1) {},
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
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
                                controller: _5Controller,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColor.textFieldColor,
                                   errorText: validators['five'],
                                  hintText: '0',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 217, 217, 217),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xff585656),
                                    ),
                                  ),
                                ),
                                obscureText: true,
                                onSaved: (Pin1) {},
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
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
                                controller: _6Controller,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColor.textFieldColor,
                                   errorText: validators['six'],
                                  hintText: '0',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 217, 217, 217),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xff585656),
                                    ),
                                  ),
                                ),
                                obscureText: true,
                                onSaved: (Pin1) {},
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    AppButton(
                        buttonText: 'Verify email',
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
                        fontsize: 15,
                        // fontWeight: F,
                        textColor: Colors.white,
                        // color.AppColor.textColor3,
                        onTap: () {
                          _verifyEmail();
                          // _registration();
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (Builder) => AccountSuccess(),
                          //   ),
                          // );
                        }),
                    const SizedBox(
                      height: 20,
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
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: AppContentText(text: 'Email Verification'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _verifyEmail() async {
    await UserService().removeStorage();
    var one = _1Controller.text.trim();
    var two = _2Controller.text.trim();
    var three = _3Controller.text.trim();
    var four = _4Controller.text.trim();
    var five = _5Controller.text.trim();
    var six = _6Controller.text.trim();

    var otpValues = '${one + two + three + four + five + six}';
    String otp = otpValues;
    VerifyEmailModel verifyEmailModel = VerifyEmailModel(otp: otpValues);
    setState(() {
      for (var key in validators.keys) {
        validators[key] = null;
      }
    });
    UserRespository()
        .VerifyEmail(verifyEmailModel.toJson())
        .then((response) async {
     
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => const AccountSuccess()));
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
