import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  VoidCallback onTap;
  Color? buttonColor;
  LinearGradient? gradientColor;
  double? borderRadius;
  Color? textColor;
  final String buttonText;
  double? size;
  Color? borderColor;
  Color? iconColor;
  double? height;
  double? width;
  double? fontsize;
  EdgeInsets?  padding;
  FontWeight? fontWeight = FontWeight.bold;
  final IconData? icon;
  final IconData? icon2;
  final double? iconSize;
  final double? iconSize2;

  AppButton({
    Key? key,
    required this.onTap,
    this.buttonColor,
    this.borderRadius,
    this.textColor,
    required this.buttonText,
    this.size,
    this.borderColor,
    this.iconColor,
    this.height,
    this.width,
    this.fontsize,
    this.padding,
    this.fontWeight,
    this.icon,
    this.icon2,
    this.iconSize,
    this.iconSize2,
    this.gradientColor,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all( 10),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor ?? Colors.white,
        gradient: gradientColor,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      child: Material(
        color: Color.fromARGB(0, 4, 2, 2),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding:  padding,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  // Icon(icon, color: iconColor, size: iconSize,),
                   SizedBox(width: 2,),
                  //  Spacer(),
                  Text(buttonText,
                  style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: fontsize,
                    fontWeight: fontWeight,
                  ),),
                  // SizedBox(width: 2,),
                  Spacer(),
                    // Icon(icon2, color: iconColor, size: iconSize2,),
                ],
              ),
              
            ),
          ),
        ),
      ),
    );
  }
}