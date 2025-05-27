import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/size_extensions.dart';
import '../../../../core/widgets/w_button.dart';
import '../../../../core/widgets/w_rounded_container.dart';

class ProductBottomBar extends StatelessWidget {
  const ProductBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        color: context.colors.lightBlue,
      ),
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 20.w,
        bottom: 30.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text("\$32", style: context.styles.s30w400),
              Spacer(),
              WRoundedContainer(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.w),
                borderRadius: BorderRadius.circular(50),
                color: context.colors.dark,
                child: Row(
                  spacing: 20.o,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 12.o,
                        backgroundColor: context.colors.white.withOpacity(0.15),
                        child: Icon(
                          Icons.remove,
                          color: context.colors.white,
                          size: 20.w,
                        ),
                      ),
                    ),

                    Text(
                      "1",
                      style: context.styles.s16w700.copyWith(
                        color: context.colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 12.o,
                        backgroundColor: context.colors.white.withOpacity(0.15),
                        child: Icon(
                          Icons.add,
                          color: context.colors.white,
                          size: 20.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          24.height,
          WButton(
            color: context.colors.primaryOrange,
            borderRadius: 12,
            padding: EdgeInsets.symmetric(vertical: 20.w),
            onTap: () {},
            child: Text(
              "ADD TO CART",
              style: context.styles.s16w800.copyWith(
                color: context.colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
