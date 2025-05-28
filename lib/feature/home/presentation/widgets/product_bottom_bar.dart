import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extension/size_extensions.dart';
import '../../../../core/routes/app_names.dart';
import '../../../../core/widgets/w_button.dart';
import '../../../../core/widgets/w_rounded_container.dart';
import '../blocs/cubit/product_detail_cubit.dart';
import '../blocs/cubit/product_detail_state.dart';

class ProductBottomBar extends StatelessWidget {
  final String id;
  const ProductBottomBar({super.key, required this.id});

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: const Text(
            "Tabriklaymiz!",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          content: const Text(
            "Mahsulot savatchaga qoshildi",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.go(AppNames.mainScreen);
              },
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

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
              BlocBuilder<ProductDetailCubit, ProductDetailState>(
                builder: (context, state) {
                  return Text(
                    "\$${state.total}",
                    style: context.styles.s30w400,
                  );
                },
              ),
              Spacer(),
              WRoundedContainer(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.w),
                borderRadius: BorderRadius.circular(50),
                color: context.colors.dark,
                child: Row(
                  spacing: 20.o,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<ProductDetailCubit>().decrement();
                      },
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

                    BlocBuilder<ProductDetailCubit, ProductDetailState>(
                      builder: (context, state) {
                        return Text(
                          state.count.toString(),
                          style: context.styles.s16w700.copyWith(
                            color: context.colors.white,
                          ),
                        );
                      },
                    ),
                    InkWell(
                      onTap: () {
                        context.read<ProductDetailCubit>().increment();
                      },
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
          BlocConsumer<ProductDetailCubit, ProductDetailState>(
            listener: (context, state) {
              if (state.bottonAddCart) {
                showSuccessDialog(context);
              }
            },
            builder: (context, state) {
              return WButton(
                color: context.colors.primaryOrange,
                borderRadius: 12,
                padding: EdgeInsets.symmetric(vertical: 20.w),
                onTap: () async {
                  context.read<ProductDetailCubit>().addToCart(id);
                },
                child:
                    state.bottonAddCart
                        ? CupertinoActivityIndicator()
                        : Text(
                          "ADD TO CART",
                          style: context.styles.s16w800.copyWith(
                            color: context.colors.white,
                          ),
                        ),
              );
            },
          ),
        ],
      ),
    );
  }
}
