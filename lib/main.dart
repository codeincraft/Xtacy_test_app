import 'dart:io';

import 'package:estacy/authentication/forgot_password_email.dart';
import 'package:estacy/authentication/verify_email.dart';
import 'package:estacy/authentication/verify_password_otp.dart';
import 'package:estacy/authentication/welcome_screen.dart';
import 'package:estacy/home/bottom_nav_widget.dart';
import 'package:estacy/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:estacy/constants/app_colors.dart' as color;
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as httpClient;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(const EstacyApp());
  });
}

class EstacyApp extends StatelessWidget {
  const EstacyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Estacy',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const WelcomeScreen(),
      builder: EasyLoading.init(),
    );
  }
}
