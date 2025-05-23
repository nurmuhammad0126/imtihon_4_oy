import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:exam_4/core/extension/widget_extensions.dart';
import 'package:flutter/material.dart';

class WSwitchButton extends StatefulWidget {
  final Function onTap;
  final double? width;
  final double? height;
  final Duration? duration;
  final double? borderRadius;
  final Color? activeColor;
  final Color? deActiveColor;
  final EdgeInsets? padding;
  final Color? circleColor;
  final Gradient? gradient;
  final bool isActive;
  const WSwitchButton({
    super.key,
    required this.onTap,
    this.width,
    this.height,
    this.duration,
    this.borderRadius,
    this.activeColor,
    this.deActiveColor,
    this.padding,
    this.circleColor,
    this.gradient,
    required this.isActive,
  });

  @override
  State<WSwitchButton> createState() => _WSwitchButtonState();
}

class _WSwitchButtonState extends State<WSwitchButton> {
  bool _isSwitched = false;

  @override
  void initState() {
    _isSwitched = widget.isActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        setState(() {
          _isSwitched = !_isSwitched;
        });
      },
      child: AnimatedContainer(
        duration: widget.duration ?? const Duration(milliseconds: 200),
        width: widget.width ?? 50.0,
        height: widget.height ?? 28.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 20.0),
          // color: _isSwitched
          //     ? widget.activeColor ?? AppColors.greyish5
          //     : widget.deActiveColor ?? AppColors.greyish3,
        ),
        // padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 2.0),
        // alignment: _isSwitched ? Alignment.centerRight : Alignment.centerLeft,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 20.0),
          child: Stack(
            children: [
              AnimatedAlign(
                duration: widget.duration ?? const Duration(milliseconds: 200),
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  duration:
                      widget.duration ?? const Duration(milliseconds: 200),
                  width: _isSwitched ? 50.o : 0,
                  height: 30.o,
                  decoration: BoxDecoration(
                    // color: AppColors.grey3,
                    gradient: widget.gradient,
                    borderRadius: BorderRadius.circular(
                      widget.borderRadius ?? 20.0,
                    ),
                  ),
                ),
              ),
              AnimatedAlign(
                duration: widget.duration ?? const Duration(milliseconds: 200),
                alignment:
                    _isSwitched ? Alignment.centerRight : Alignment.centerLeft,
                child: AnimatedContainer(
                  duration:
                      widget.duration ?? const Duration(milliseconds: 200),
                  width: (widget.width != null ? widget.width! / 2 : 24.0).o,
                  height:
                      (widget.height != null ? widget.height! / 1.4 : 24.0).o,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.circleColor ?? Colors.white,
                  ),
                ).paddingSymmetric(horizontal: 1.w),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
