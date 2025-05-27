import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:exam_4/core/extension/widget_extensions.dart';
import 'package:exam_4/core/widgets/w_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/w_button.dart';

class AccessLocationScreen extends StatelessWidget {
  const AccessLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WRoundedContainer(
            borderRadius: BorderRadius.circular(90.w),
            color: context.colors.blueGray,
            child: SizedBox(width: 206.w, height: 250.w),
          ),
          30.height,
          WButton(
            color: context.colors.orange,
            borderRadius: 12,
            padding: EdgeInsets.symmetric(vertical: 20.w),
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "ACCESS LOCATION",
                  style: context.styles.s16w800.copyWith(
                    color: context.colors.white,
                  ),
                ),
                24.width,
                CircleAvatar(
                  backgroundColor: context.colors.white.withOpacity(0.25),
                  child: SvgPicture.asset(context.icons.location, width: 16.w),
                ),
              ],
            ),
          ).paddingSymmetric(horizontal: 24.w, vertical: 30),
          16.height,
          SizedBox(
            width: 260.w,
            child: Text(
              textAlign: TextAlign.center,
              "FOOD WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP",
              style: context.styles.s14w400.copyWith(
                color: context.colors.gray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
