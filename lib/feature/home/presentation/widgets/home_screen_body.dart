import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:exam_4/core/extension/widget_extensions.dart';
import 'package:exam_4/feature/home/presentation/widgets/home_product_widget.dart';
import 'package:exam_4/feature/home/presentation/widgets/info_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/w_rounded_container.dart';
import '../blocs/bloc/product_bloc.dart';
import '../blocs/bloc/product_state.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.height,
          Text(
            "Popular Burgers",
            style: context.styles.s20w400,
          ).paddingOnly(left: 24.w),
          24.height,
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductLoaded) {
                final products = state.products;
                return GridView.builder(
                  shrinkWrap: true,
                  itemCount: products.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 21.w,

                    crossAxisSpacing: 21.w,
                    mainAxisExtent: 210.h,
                  ),
                  itemBuilder: (context, index) {
                    final pro = products[index];
                    print(pro.id);
                    print("=====================================");

                    return HomeProductWidget(
                      product: pro
                    );
                  },
                );
              } else if (state is ProductError) {
                return Center(child: Text("Error: ${state.message}"));
              }
              return const Text("Salom");
            },
          ).paddingSymmetric(horizontal: 24.w),

          Text(
            "Open Resturants",
            style: context.styles.s20w400,
          ).paddingOnly(left: 24.w),
          16.height,
          WRoundedContainer(
            color: context.colors.blueGray,
            child: SizedBox(width: double.infinity, height: 150.h),
          ).paddingSymmetric(horizontal: 24.w),
          Text(
            "Tasty treat Gallery",
            style: context.styles.s20w400,
          ).paddingOnly(left: 24.w, top: 14.h),

          InfoRowWidget().paddingOnly(left: 24.w, top: 8.h),
        ],
      ),
    );
  }
}
