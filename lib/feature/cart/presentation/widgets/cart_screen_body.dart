import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:exam_4/core/extension/widget_extensions.dart';
import 'package:exam_4/core/service/user_remote_service.dart';
import 'package:exam_4/core/widgets/w_cached_network_image.dart';
import 'package:exam_4/core/widgets/w_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service/user_local_service.dart';
import '../blocs/bloc/cart_bloc.dart';

class CartScreenBody extends StatefulWidget {
  const CartScreenBody({super.key});

  @override
  State<CartScreenBody> createState() => _CartScreenBodyState();
}

class _CartScreenBodyState extends State<CartScreenBody> {
  void init() async {
    final userId = await UserLocalService().getUserId();
    print("USER ID: $userId");
    if (mounted && userId != null) {
      print("USER ID: $userId");
      context.read<CartBloc>().add(InitProductEvent(userId: userId));
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
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.cartStatus == CartStatus.load) {
                return Center(
                  child: CircularProgressIndicator(color: context.colors.white),
                );
              }
              if (state.cartStatus == CartStatus.error) {
                return Text("Malumotlar Yoq!", style: context.styles.s26w800);
              }
              if (state.cartStatus == CartStatus.succes) {
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
                                      BlocBuilder<CartBloc, CartState>(
                                        builder: (context, state) {
                                          return Text(
                                            cart.count.toString(),
                                            style: context.styles.s16w700
                                                .copyWith(
                                                  color: context.colors.white,
                                                ),
                                          );
                                        },
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
