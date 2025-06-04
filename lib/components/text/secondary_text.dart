import 'package:bmical/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SecondaryText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  const SecondaryText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.overflow,
    this.maxLines,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color ?? appTextColorSecondary,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    );
  }
}
