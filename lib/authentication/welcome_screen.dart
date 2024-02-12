import 'dart:ui';

import 'package:estacy/authentication/create_account.dart';
import 'package:estacy/authentication/signin.dart';
import 'package:estacy/constants/app_colors.dart';
import 'package:estacy/widgets/app_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.background,
      extendBody: true,
      body: Stack(children: [
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
            child: Column(
              children: [
                const Spacer(),
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    // color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        image: AssetImage('assets/Rectangle 25.png'),
                        fit: BoxFit.contain),
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (build) => const CreateAccount(),
                            ),
                          );
                        },
                        buttonText: 'Create an account',
                        height: 50,
                        width: screenWidth,
                        textColor: Colors.white,
                        gradientColor: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColor.gradientButtonColor1,
                              Color.fromARGB(255, 187, 149, 149),
                              AppColor.gradientButtonColor1,
                              AppColor.gradientButtonColor2
                            ]),
                        borderRadius: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (build) => const SignIn(),
                            ),
                          );
                        },
                        buttonText: 'Sign in',
                        height: 50,
                        width: screenWidth,
                        textColor: AppColor.textColor,
                        borderRadius: 10,
                        borderColor: AppColor.textColor,
                        buttonColor: Colors.transparent,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
