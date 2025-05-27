import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:exam_4/core/extension/widget_extensions.dart';
import 'package:exam_4/core/widgets/w_rounded_container.dart';
import 'package:exam_4/feature/cart/presentation/widgets/cart_screen_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/w_button.dart';
import '../../../../core/widgets/w_textfield.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.dark,
      appBar: CartScreenAppBar(),
      body: Column(
        children: [
          24.height,
          ListView.separated(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    WRoundedContainer(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(28.o),
                        bottom: Radius.circular(18.o),
                      ),
                      color: context.colors.white.withOpacity(0.15),
                      child: SizedBox(width: 136.w, height: 125.h),
                    ).paddingSymmetric(horizontal: 24.w),
                    20.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 126.w,
                          child: Text(
                            "Pizza Calzone European",
                            style: context.styles.s18w400.copyWith(
                              color: context.colors.white,
                            ),
                          ),
                        ),
                        10.height,
                        Text(
                          "\$44",
                          style: context.styles.s20w700.copyWith(
                            color: context.colors.white,
                          ),
                        ),
                        17.height,
                        Row(
                          children: [
                            Text(
                              "14'’",
                              style: context.styles.s18w400.copyWith(
                                color: context.colors.white,
                              ),
                            ),
                            50.width,
                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 12.o,
                                backgroundColor: context.colors.white
                                    .withOpacity(0.15),
                                child: Icon(
                                  Icons.remove,
                                  color: context.colors.white,
                                  size: 15.w,
                                ),
                              ),
                            ),
                            20.width,
                            Text(
                              "1",
                              style: context.styles.s16w700.copyWith(
                                color: context.colors.white,
                              ),
                            ),
                            20.width,

                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 12.o,
                                backgroundColor: context.colors.white
                                    .withOpacity(0.15),
                                child: Icon(
                                  Icons.add,
                                  color: context.colors.white,
                                  size: 15.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 32.o),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 24.w,
          bottom: 30.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.w)),
          color: context.colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DELIVERY ADDRESS",
                  style: context.styles.s14w400.copyWith(
                    color: context.colors.gray,
                  ),
                ),

                Text(
                  "EDIT ITEMS",
                  style: context.styles.s14w400.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: context.colors.orange,
                    color: context.colors.orange,
                  ),
                ),
              ],
            ),
            10.height,
            WTextField(
              controller: controller,
              contentPadding: EdgeInsets.only(
                left: 19.o,
                top: 22.o,
                bottom: 23.o,
              ),
              hasBorderColor: false,
              border: Border.all(color: context.colors.lightBlue),
              borderRadius: 10.o,
              borderColor: context.colors.lightBlue,
              fillColor: context.colors.lightBlue,
              hintText: "2118 Thornridge Cir. Syracuse",
              hintTextStyle: context.styles.s14w400.copyWith(
                color: context.colors.blueGray,
              ),
            ),
            30.height,
            Row(
              children: [
                Text(
                  "Total: ",
                  style: context.styles.s14w400.copyWith(
                    color: context.colors.gray,
                  ),
                ),
                12.width,
                Text("\$96", style: context.styles.s30w400),
                Spacer(),
                Text(
                  "Breakdown ",
                  style: context.styles.s14w400.copyWith(
                    color: context.colors.orange,
                  ),
                ),
                7.width,
                Icon(Icons.arrow_forward_ios_rounded, size: 15.w),
              ],
            ),
            32.height,
            WButton(
              color: context.colors.primaryOrange,
              borderRadius: 12,
              padding: EdgeInsets.symmetric(vertical: 20.w),
              onTap: () {},
              child: Text(
                "PLACE ORDER ",
                style: context.styles.s16w800.copyWith(
                  color: context.colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
