import 'package:flutter/material.dart';

class WRoundedContainer extends StatelessWidget {
  final Border? border;
  final double? height;
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Clip clip;

  const WRoundedContainer({
    super.key,

    required this.color,
    required this.child,
    this.border,
    this.padding,
    this.margin,
    this.height,
    this.clip = Clip.none,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: clip,
      margin: margin,
      padding: padding,
      height: height,
      decoration: BoxDecoration(
        border: border,
        color: color,
        borderRadius: borderRadius??  BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
