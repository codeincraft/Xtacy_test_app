import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:estacy/constants/app_colors.dart';
import 'package:estacy/home/app_bar.dart';
import 'package:estacy/main.dart';
import 'package:estacy/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              height: screenHeight,
              width: screenWidth,
              child: Column(
                children: [
                  Container(
                    height: screenHeight * 0.35,
                    width: screenWidth,
                    padding:
                        const EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        EstacyAppBar(
                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(),
                            ),
                            child: const Icon(IconlyBroken.profile, size: 20,),
                          ),
                          titleWidget: const Image(
                            image: AssetImage('assets/Welcome, Sam 👋🏾.png'),
                          ),
                          sideTitle: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(),
                            ),
                            child: const Icon(IconlyLight.notification, size: 20,),
                          ),
                          showActionBar: true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: screenHeight * 0.15,
                          width: screenWidth * 0.90,
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColor.gradientButtonColor1,
                                  AppColor.gradientButtonColor1,
                                  AppColor.gradientButtonColor1,
                                  AppColor.gradientButtonColor2,
                                ]),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: screenWidth * 0.33,
                                height: screenHeight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      child: AppContentText(
                                        text: 'WALLET BALANCE',
                                        size: 12,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        FittedBox(
                                          child: AppContentText(
                                            text: 'NGN 0.000',
                                            size: 17,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(
                                          Icons.visibility_off_outlined,
                                          size: 18,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 25,
                                      width: screenWidth * 0.35,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 20),
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              // Color.fromARGB(255, 250, 187, 251),
                                              Color.fromARGB(255, 253, 216, 238),
                                              Color.fromARGB(255, 253, 216, 238),
                                              // Color.fromARGB(255, 254, 204, 234),
                                            ]),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          FittedBox(
                                            child: AppContentText(
                                              text: 'Cashback',
                                              size: 10,
                                              color: AppColor.background,
                                            ),
                                          ),
                                          const Spacer(),
                                          FittedBox(
                                            child: AppContentText(
                                              text: 'N0.00',
                                              size: 10,
                                              color:
                                                  AppColor.gradientButtonColor1,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              const VerticalDivider(),
                              const Spacer(),
                              Container(
                                width: screenWidth * 0.33,
                                height: screenHeight,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        // AppColor.gradientButtonColor1,
                                        Color.fromARGB(255, 254, 159, 69),
                                        Color.fromARGB(255, 255, 210, 167),
                                      ]),
                                ),
                                child: Center(
                                  child: FittedBox(
                                    child: Text(
                                      'Generate Acct',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'AeonikTRIAL-Light.otf',
                                              color: Colors.white,
                                              decoration:
                                                  TextDecoration.underline),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(height: 10,),
                        SizedBox(
                          height: screenHeight * 0.10,
                          width: screenWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Spacer(),
                              SizedBox(
                                height: screenHeight * 0.10,
                                width: screenWidth * 0.25,
                                child: Column(
                                  children: [
                                    const Icon(IconlyLight.plus),
                                    FittedBox(
                                      child: AppContentText(
                                        text: 'Top up',
                                        color: AppColor.background,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const VerticalDivider(),
                              SizedBox(
                                height: screenHeight * 0.10,
                                width: screenWidth * 0.25,
                                child: Column(
                                  children: [
                                    const Icon(Icons.telegram_outlined),
                                    FittedBox(
                                      child: AppContentText(
                                        text: 'Transfer',
                                        color: AppColor.background,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const VerticalDivider(),
                              SizedBox(
                                height: screenHeight * 0.10,
                                width: screenWidth * 0.25,
                                child: Column(
                                  children: [
                                    const Icon(Icons.history),
                                    FittedBox(
                                      child: AppContentText(
                                        text: 'History',
                                        color: AppColor.background,
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
                  SizedBox(
                    height: screenHeight * 0.29,
                    width: screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: AppContentText(
                              text: 'Quick Actions',
                              size: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: screenWidth,
                              height: screenHeight * 0.20,
                              child: Column(
                                children: [
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 60,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: AppColor.textFieldColor,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Action card.png'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 60,
                                            width: 70,
                                            decoration: const BoxDecoration(
                                              color: AppColor.textFieldColor,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Action card-2.png'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 60,
                                            width: 70,
                                            decoration: const BoxDecoration(
                                              color: AppColor.textFieldColor,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Action card-3.png'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 60,
                                            width: 70,
                                            decoration: const BoxDecoration(
                                              color: AppColor.textFieldColor,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Action card-4.png'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 60,
                                            width: 70,
                                            decoration: const BoxDecoration(
                                              color: AppColor.textFieldColor,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Action card-5.png'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 60,
                                            width: 70,
                                            decoration: const BoxDecoration(
                                              color: AppColor.textFieldColor,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Action card-6.png'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 60,
                                            width: 70,
                                            decoration: const BoxDecoration(
                                              color: AppColor.textFieldColor,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Action card-7.png'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 60,
                                            width: 70,
                                            decoration: const BoxDecoration(
                                              color: AppColor.textFieldColor,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Action card-8.png'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.20,
                    width: screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        // vertical:8.0, 
                        horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              FittedBox(
                                child: AppContentText(text: 'News & Update', fontWeight: FontWeight.w600, size: 20,),
                              ),
                              const Spacer(),
                              FittedBox(
                                child: AppContentText(text: 'View all', 
                                color: AppColor.gradientButtonColor1,
                                fontWeight: FontWeight.w600, 
                                size: 18,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Expanded(
                            child: Swiper(
                              viewportFraction: 0.9,
                              // onIndexChanged: (value) {
                              //   this.indexNew;
                              // },
                              // autoplay: true,
                              // autoplayDelay:1,
                              itemCount: 3,
                              // slide.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                    height: screenHeight * 0.28,
                                    width: screenWidth * 0.90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/Rectangle 32.png'),
                                                fit: BoxFit.cover)),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColor.gradientButtonColor1,
                                  AppColor.gradientButtonColor1,
                                  AppColor.gradientButtonColor1,
                                  AppColor.gradientButtonColor2,
                                ]),
        ),
        
        child: const Image(image: AssetImage('assets/Chat_Conversation_Circle.png')),
      ),
    );
  }
}
