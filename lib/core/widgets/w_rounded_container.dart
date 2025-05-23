import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:flutter/material.dart';

class WRoundedContainer extends StatelessWidget {
  final double? height;
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final Clip clip;

  const WRoundedContainer({
    super.key,

    required this.color,
    required this.child,
    this.padding,
    this.margin,
    this.height,
    this.clip = Clip.none,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: clip,
      margin: margin,
      padding: padding,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius.o),
      ),
      child: child,
    );
  }
}
