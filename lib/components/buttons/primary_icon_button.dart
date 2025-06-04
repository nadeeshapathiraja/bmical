import 'package:bmical/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  final double? iconSize;
  final Color? color;

  const PrimaryIconButton({
    Key? key,
    required this.onPressed,
    this.icon,
    this.iconSize,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color ?? appPrimaryColor,
      iconSize: iconSize ?? 30,
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
