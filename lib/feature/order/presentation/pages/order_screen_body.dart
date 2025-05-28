import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:exam_4/core/extension/widget_extensions.dart';
import 'package:exam_4/core/service/user_remote_service.dart';
import 'package:exam_4/core/widgets/w_cached_network_image.dart';
import 'package:exam_4/core/widgets/w_rounded_container.dart';
import 'package:exam_4/feature/order/presentation/bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service/user_local_service.dart';

class OrderScreenBody extends StatefulWidget {
  const OrderScreenBody({super.key});

  @override
  State<OrderScreenBody> createState() => _CartScreenBodyState();
}

class _CartScreenBodyState extends State<OrderScreenBody> {
  void init() async {
    final userId = await UserLocalService().getUserId();
    print("USER ID: $userId");
    if (mounted && userId != null) {
      print("USER ID: $userId");
      context.read<OrderBloc>().add(InitialProductEvent(userId: userId));
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          24.height,
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              if (state.cartStatus == OrderStatus.load) {
                return Center(
                  child: CircularProgressIndicator(color: context.colors.white),
                );
              }
              if (state.cartStatus == OrderStatus.error) {
                return Text("Malumotlar Yoq!", style: context.styles.s26w800);
              }
              if (state.cartStatus == OrderStatus.succes) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.products!.length,
                  itemBuilder: (context, index) {
                    final cart = state.products![index];
                    return FutureBuilder(
                      future: UserRemoteService(
                        FirebaseFirestore.instance,
                      ).getProductId(cart.productId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: context.colors.white,
                            ),
                          );
                        }
                        final pro = snapshot.data;
                        return SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              WRoundedContainer(
                                clip: Clip.hardEdge,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(28.o),
                                  bottom: Radius.circular(18.o),
                                ),
                                color: context.colors.white.withOpacity(0.15),
                                child: SizedBox(
                                  width: 136.w,
                                  height: 125.h,
                                  child: WCachedImage(
                                    imageUrl: pro?.image ?? "",
                                  ),
                                ),
                              ).paddingSymmetric(horizontal: 24.w),

                              20.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 126.w,
                                    child: Text(
                                      pro?.name ?? "",
                                      style: context.styles.s18w400.copyWith(
                                        color: context.colors.white,
                                      ),
                                    ),
                                  ),
                                  10.height,
                                  Text(
                                    "\$${cart.total}",
                                    style: context.styles.s20w700.copyWith(
                                      color: context.colors.white,
                                    ),
                                  ),
                                  17.height,
                                  Row(
                                    children: [
                                      Text(
                                        cart.size,
                                        style: context.styles.s18w400.copyWith(
                                          color: context.colors.white,
                                        ),
                                      ),
                                      50.width,
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 32.o),
                );
              }
              return Center(
                child: Text(
                  "Malumotlar Yoq!!",
                  style: context.styles.s26w800.copyWith(
                    color: context.colors.white,
                  ),
                ),
              );
            },
          ),
          50.height,
        ],
      ),
    );
  }
}
