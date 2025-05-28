import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:exam_4/core/routes/app_names.dart';
import 'package:exam_4/core/service/user_local_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/w_button.dart';
import '../../../../core/widgets/w_textfield.dart';
import '../blocs/bloc/cart_bloc.dart';

class CartScreenBottomNavigation extends StatelessWidget {
  const CartScreenBottomNavigation({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Text(
                    "\$${state.total}",
                    style: context.styles.s30w400,
                  );
                },
              ),
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
            onTap: () async {
              final userId = await UserLocalService().getUserId();
              if (userId != null && context.mounted) {
                context.read<CartBloc>().add(UpdateCart(userId: userId));
              }
            },
            child: BlocConsumer<CartBloc, CartState>(
              builder: (context, state) {
                if (state.cartStatus == CartStatus.load) {
                  return Center(child: CupertinoActivityIndicator());
                }
                return Text(
                  "PLACE ORDER ",
                  style: context.styles.s16w800.copyWith(
                    color: context.colors.white,
                  ),
                );
              },
              listener: (BuildContext context, CartState state) async {
                if (state.cartStatus == CartStatus.succes) {
                  context.go(AppNames.congratulations);
                    
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
