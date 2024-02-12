// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:estacy/constants/app_colors.dart' as color;

// import 'package:noshtrybe/constants/app_color.dart' as color;

class AppTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  dynamic? keyboardType;
  final  suffixIcon;
  final suffix;
  final  onSaved;
  final validator;
  final String? initialValue;
  final prefixIcon;
  final Color? fillColor;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final String? errorText;
  final VoidCallback? onTap;
  final AutovalidateMode? autovalidateMode;
  final int? maxLines;

    AppTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.suffix,
    this.onSaved,
    this.validator,
    this.initialValue,
    this.fillColor,
    this.borderColor,
    this.enabledBorderColor,
    this.backgroundColor,
    this.errorText,
    this.onTap,
    this.maxLines,
    this.autovalidateMode,
    this.textColor
    
  });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      maxLines: maxLines ?? 1,
      onTap: onTap,
      autovalidateMode: autovalidateMode,
      style: TextStyle(
        color: textColor ?? Colors.white,
      ),
      // onSaved: onSaved,
      // initialValue: initialValue,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controller,
      decoration:  InputDecoration(
        // contentPadding: EdgeInsets.all(5),
        // isCollapsed: true,
        filled: true,
        focusColor: Colors.white,
        isDense: true,
        errorText: errorText ,
        suffixIcon: suffixIcon,
        suffix: suffix,
        prefixIcon: prefixIcon,
        alignLabelWithHint: true,
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: enabledBorderColor ??Color.fromARGB(255, 217, 217, 217),
            ),
        ),
        focusedBorder:  OutlineInputBorder(
           borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: borderColor ?? Color(0xff585656),
          ),   
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: color.AppColor.textColor,
          backgroundColor: backgroundColor ?? Colors.transparent,
        // color: color.AppColor.textColor2
        ),
        fillColor:  fillColor ?? Color.fromARGB(255, 26, 26, 26)),
        enabled: true,
    );
  }
}
