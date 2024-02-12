import 'dart:ui';
import 'package:estacy/authentication/welcome_screen.dart';
import 'package:estacy/constants/app_colors.dart';
import 'package:estacy/widgets/app_button.dart';
import 'package:estacy/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AccountSuccess extends StatelessWidget {
  const AccountSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Stack(
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
              padding: const EdgeInsets.all(20),
              // color: color.AppColor.background,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    const Image(
                      image: AssetImage('assets/Frame 36431.png'),
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    FittedBox(
                      child: AppContentText(
                        text: 'You are all set',
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FittedBox(
                      child: AppContentText(
                        text: 'Your account has been created\nsuccesfully',
                        textAlign: TextAlign.center,
                        size: 20,
                        color: AppColor.textColor,
                      ),
                    ),
                    const SizedBox(height: 50,),
                    AppButton(
                        buttonText: 'Proceed to home',
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
                        // fontWeight: FontWeight.bold,
                        textColor: Colors.white,
                        // color.AppColor.textColor3,
                        onTap: () {
                          // _registration();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (Builder) => const WelcomeScreen(),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
