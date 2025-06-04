import 'package:bmical/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final bool selected;
  final double? elevation;
  final double? borderRadius;
  const PrimaryCard({
    super.key,
    this.child,
    this.margin,
    this.color,
    this.borderRadius,
    this.elevation,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: color ?? appWhiteColor,
      margin: margin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
        // side: BorderSide(
        //   color: selected == true ? appSuccessColor : appWhiteColor,
        //   width: 2.0,
        // ),
      ),
      child: child,
    );
  }
}
