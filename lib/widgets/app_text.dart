import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:estacy/constants/app_colors.dart' as color;

class AppHeadingText extends StatelessWidget {
  double size;
  final TextAlign? textAlign;
  final String text;
  final Color color;
  final fontFamily;
  final  fontWeight;
  final FontStyle? fontStyle;
  
  double? fontSize;
   AppHeadingText({super.key, 
  required this.text, 
  this.textAlign,
  this.fontSize,
  this.fontFamily,
  this.fontWeight,
   this.color = Colors.black,
  this.size = 30,
  this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunitoSans(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        height: 1,
        
        
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class AppContentText extends StatelessWidget {
  double size;
  double? height;
  double? wordSpacing;
  final TextAlign? textAlign;
  final String text;
  final Color? color;
  final LinearGradient? gradientColor;
  final  TextOverflow? overflow;
  final  fontWeight;
  int? maxLines;
  final TextStyle? textStyle;
  final FontStyle? fontStyle;
  AppContentText({
    Key? key,
    this.size = 14,
    this.height,
    this.wordSpacing,
    this.textAlign,
    required this.text,
    this.color,
    this.gradientColor,
    this.overflow,
    this.maxLines,
    this.textStyle,
    this.fontStyle,
     this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.headline4!.copyWith(
        fontFamily: 'AeonikTRIAL-Regular.otf',
        fontSize: size,
        fontWeight: fontWeight,
        // fontStyle: 
        height: height ?? 1.5,
        letterSpacing: wordSpacing ?? 0,
        fontStyle: fontStyle,
        color: color ?? Colors.white
      )
      // GoogleFonts.poppins(
      //   color: color ?? Color.fromARGB(255, 231, 231, 231),
      //   fontSize: size,
      //   fontWeight: fontWeight,
      //   textStyle: textStyle,
      //  height: height ?? 1.5,
      
      //  letterSpacing: wordSpacing ?? 0,
      // ),
    );
  }
}
