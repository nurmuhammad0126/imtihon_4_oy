import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:exam_4/core/extension/widget_extensions.dart';
import 'package:exam_4/core/routes/app_names.dart';
import 'package:exam_4/core/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/w_cached_network_image.dart';
import '../../../../core/widgets/w_rounded_container.dart';
import '../../data/model/product_model.dart';

class HomeProductWidget extends StatelessWidget {
  final ProductModel product;
  const HomeProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppNames.homeDetail, extra: product);
      },
      child: SizedBox(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 130.h,
                clipBehavior: Clip.hardEdge,

                decoration: BoxDecoration(
                  color: context.colors.white,
                  borderRadius: BorderRadius.circular(24.o),

                  boxShadow: [
                    BoxShadow(
                      offset: Offset(12, 12),
                      blurRadius: 30,
                      spreadRadius: 0,
                      color: Color(0xFF96969A).withOpacity(0.15),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(product.name, style: context.styles.s18w700),
                    Text(
                      product.title,
                      style: context.styles.s14w400.copyWith(
                        color: context.colors.darkGray,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${product.price}",
                          style: context.styles.s16w700,
                        ),
                        WButton(
                          color: context.colors.primaryOrange,
                          borderRadius: 30,
                          padding: EdgeInsets.zero,
                          height: 40.w,
                          onTap: () {
                            context.go(AppNames.homeDetail, extra: product);
                          },
                          width: 40.w,
                          child: Center(
                            child: Icon(Icons.add, color: context.colors.white),
                          ),
                        ).paddingAll(10),
                      ],
                    ),
                  ],
                ).paddingSymmetric(horizontal: 12.w),
              ),
            ),
            Positioned(
              top: 0,

              left: 17.w,
              right: 17.w,
              child: WRoundedContainer(
                clip: Clip.hardEdge,
                color: context.colors.blueGray,
                child: SizedBox(
                  width: 122.w,
                  height: 85.h,
                  child: WCachedImage(imageUrl: product.image),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
