
import 'package:bmical/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryCircleButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? padding;
  final double? size;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconcolor;
  const PrimaryCircleButton(
      {super.key,
      required this.onPressed,
      this.padding,
      this.icon,
      this.size,
      this.backgroundColor,
      this.iconcolor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Replace Icons.star with your desired icon
      style: ElevatedButton.styleFrom(
        minimumSize: Size(0, 0),
        shape:
            const CircleBorder(), // Optional: You can customize the button shape
        backgroundColor: backgroundColor,
        padding: EdgeInsets.all(
            padding ?? 16.0), // Optional: You can adjust the padding
      ),
      child: Icon(
        icon ?? Icons.arrow_back_ios_new,
        size: size ?? 24,
        color: iconcolor ?? appPrimaryColor,
      ),
    );
  }
}
