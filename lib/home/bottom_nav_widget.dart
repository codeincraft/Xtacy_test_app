import 'dart:developer';

import 'package:estacy/constants/app_colors.dart';
import 'package:estacy/home/referrals.dart';
import 'package:estacy/home/satistics_screen.dart';
import 'package:estacy/home/services_screen.dart';
import 'package:estacy/home/settings_screen.dart';
import 'package:estacy/home/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';


class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() =>
      _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final bool isSelected = false;

  List pages = [
    HomeScreen(),
    ServicesScreen(),
    StatisticsScreen(),
    ReferralsScreen(),
    SettingsScreen(),
  ];
  int _currentIndex = 0;
  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: MyAppBar(
      //   title: 'Homepage',
      //   showActionIcon: true,
      //   leading: CircleAvatar(
      //     backgroundColor: Colors.white,
      //   ),
      // ),

      // drawer: const MyNavBar(),
      backgroundColor: AppColor.background,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(),
        child: pages[_currentIndex],
      ),
      // BottomNavBar
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.background,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: AppColor.textFieldColor,
        currentIndex: _currentIndex,
        onTap: (int index) {
            setState(() {
                  _currentIndex = index;
                });
        },
        items: [
           BottomNavigationBarItem(
                activeIcon: Icon(IconlyLight.home),
                icon: Icon(
                  IconlyLight.home,
                ),
                label: 'Home',
                backgroundColor: AppColor.textColor),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.menu),
                icon: Icon(Icons.menu),
                label: 'Services',
                backgroundColor: AppColor.textColor),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.compare_arrows_sharp),
                icon: Icon(Icons.compare_arrows),
                label: 'Statistics'),
            BottomNavigationBarItem(
                activeIcon: Icon(IconlyLight.user2),
                icon: Icon(IconlyLight.user2),
                label: 'Referrals'),
            BottomNavigationBarItem(
                activeIcon: Icon(IconlyLight.setting),
                icon: Icon(IconlyLight.setting),
                label: 'Settings'),
        ])
          // NavigationBar(
          //   backgroundColor: Colors.transparent, 
          //   elevation: 0,
          //   surfaceTintColor: Colors.transparent,
          //   labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          //   animationDuration: Duration(microseconds: 300),
          //   height: 60,
          //     // indicatorColor: color.AppColor.primaryColor,
          //     // unselectedItemColor: Colors.black,
          //     // height: 60,
          //     selectedIndex: _currentIndex,
          //     onDestinationSelected: (int index){
          //       setState(() {
          //         _currentIndex = index;
          //       });
          //     },
          //     destinations: 
              
          //      [
          //   NavigationDestination(
          //       icon: Icon(IconlyLight.home, color: AppColor.textColor,),
          //       selectedIcon: Icon(IconlyLight.home, color: Colors.white),
          //       label: 'Home',),
          //   NavigationDestination(
          //       icon: Icon(IconlyLight.bookmark),
          //       selectedIcon: Icon(IconlyBold.search, color: AppColor.primaryColor,),
          //       label: 'Services'),
          //   NavigationDestination(
          //       icon: Icon(IconlyLight.chart),
              
          //       selectedIcon: Icon(IconlyBold.profile, color: AppColor.primaryColor,),
          //       label: 'Statistics'),
          //   NavigationDestination(
          //       icon: Icon(IconlyLight.profile),
              
          //       selectedIcon: Icon(IconlyBold.profile, color: AppColor.primaryColor,),
          //       label: 'Referral'),
          //   NavigationDestination(
          //       icon: Icon(IconlyLight.setting),
              
          //       selectedIcon: Icon(IconlyBold.profile, color: AppColor.primaryColor,),
          //       label: 'Settings'),
          //   // BottomNavigationBarItem(
          //   //     activeIcon: Icon(IconlyBold.home),
          //   //     icon: Icon(
          //   //       IconlyLight.home,
          //   //     ),
          //   //     label: 'Home'),
          //   // BottomNavigationBarItem(
          //   //     activeIcon: Icon(IconlyBold.search),
          //   //     icon: Icon(IconlyLight.search),
          //   //     label: 'Search'),
          //   // BottomNavigationBarItem(
          //   //     activeIcon: Icon(IconlyBold.profile),
          //   //     icon: Icon(IconlyLight.profile),
          //   //     label: 'Profile'),
          // ]
          // ),
    );
  }
}
       
