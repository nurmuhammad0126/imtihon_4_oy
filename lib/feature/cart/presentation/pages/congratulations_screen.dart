import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:exam_4/core/extension/widget_extensions.dart';
import 'package:exam_4/core/routes/app_names.dart';
import 'package:exam_4/core/widgets/w_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/w_button.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WRoundedContainer(
            borderRadius: BorderRadius.circular(32.w),
            color: context.colors.blueGray,
            child: SizedBox(width: 230.w, height: 210.w),
          ).paddingSymmetric(horizontal: 73.w),
          30.height,
          Text("Congratulations!", style: context.styles.s26w700),
          16.height,
          SizedBox(
            width: 260.w,
            child: Text(
              textAlign: TextAlign.center,
              "You successfully maked a payment, enjoy our service!",
              style: context.styles.s14w400.copyWith(
                color: context.colors.gray,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WButton(
              color: context.colors.primaryOrange,
              borderRadius: 12,
              padding: EdgeInsets.symmetric(vertical: 20.w),
              onTap: () {
                context.go(AppNames.mainScreen);
              },
              child: Text(
                "TRACK ORDER",
                style: context.styles.s16w800.copyWith(
                  color: context.colors.white,
                ),
              ),
            ).paddingSymmetric(horizontal: 24.w, vertical: 30),
          ],
        ),
      ),
    );
  }
}
