import 'package:bmical/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final bool underline;
  const PrimaryText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.underline = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.poppins(
        color: color ?? appWhiteColor,
        fontSize: fontSize ?? 16,
        decoration: underline == true ? TextDecoration.underline : null,
        decorationColor: appPrimaryColor,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    );
  }
}
