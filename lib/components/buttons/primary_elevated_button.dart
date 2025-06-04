import 'package:bmical/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class PrimaryElevatedButton extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final void Function()? onPressed;
  final double? radius;
  final OutlinedBorder? shape;

  final Color? btnBackgroundColor;
  const PrimaryElevatedButton({
    super.key,
    this.child,
    required this.onPressed,
    this.radius,
    this.shape,
    this.width,
    this.btnBackgroundColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width(),
      height: height ?? 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: btnBackgroundColor ?? appPrimaryColor,
          shape:
              shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 10),
              ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
