import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:exam_4/core/extension/widget_extensions.dart';
import 'package:exam_4/core/widgets/w_cached_network_image.dart';
import 'package:exam_4/feature/home/data/model/product_model.dart';
import 'package:exam_4/feature/home/presentation/widgets/info_row_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/w_rounded_container.dart';

class ProductBody extends StatelessWidget {
  final ProductModel product;
  const ProductBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          44.height,
          WRoundedContainer(
            borderRadius: BorderRadius.circular(32.0),
            color: context.colors.blueGray,

            child: SizedBox(
              width: double.infinity,
              height: 200.h,
              child: Stack(
                children: [
                  WCachedImage(
                    imageUrl: product.image,
                    width: double.infinity,
                    height: double.infinity,
                    borderRadius: BorderRadius.circular(32.o),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton.filled(
                      style: IconButton.styleFrom(
                        backgroundColor: context.colors.white.withOpacity(0.15),
                      ),
                      onPressed: () {
                        
                      },
                      icon: Icon(Icons.favorite_border),
                    ),
                  ).paddingAll(15.o),
                ],
              ),
            ),
          ).paddingSymmetric(horizontal: 24.w),
          24.height,
          WRoundedContainer(
            border: Border.all(color: context.colors.gray),
            borderRadius: BorderRadius.circular(50.w),
            color: context.colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/shef.png"),
                12.width,
                Text("Uttora Coffe House", style: context.styles.s14w400),
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 15.h),
          ),
          20.height,
          Text(product.name, style: context.styles.s20w700),
          7.height,

          SizedBox(
            width: 310.w,
            child: Text(
              product.title,
              style: context.styles.s14w400.copyWith(
                color: context.colors.gray,
              ),
            ),
          ),

          InfoRowWidget(),
          25.height,
          Row(
            spacing: 10.w,
            children: [
              Text("Size:", style: context.styles.s14w400),
              6.width,
              CircleAvatar(
                radius: 24.o,
                backgroundColor: context.colors.lightBlue,
                child: Text("10”", style: context.styles.s16w400),
              ),
              CircleAvatar(
                radius: 24.o,

                backgroundColor: context.colors.primaryOrange,
                child: Text(
                  "14”",
                  style: context.styles.s16w400.copyWith(
                    color: context.colors.white,
                  ),
                ),
              ),
              CircleAvatar(
                radius: 24.o,

                backgroundColor: context.colors.lightBlue,
                child: Text("16”", style: context.styles.s16w400),
              ),
            ],
          ),
          Text(
            "INGREDENTS",
            style: context.styles.s14w400,
          ).paddingSymmetric(vertical: 20.h),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 20.w,
              children: [
                for (int i = 0; i < 5; i++)
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28.o,

                        backgroundColor: context.colors.lightOrange,
                        child: Icon(
                          Icons.yard_outlined,
                          color: context.colors.orange,
                        ),
                      ),
                    ],
                  ),
                25.height,
              ],
            ),
          ),
        ],
      ).paddingOnly(left: 24),
    );
  }
}
