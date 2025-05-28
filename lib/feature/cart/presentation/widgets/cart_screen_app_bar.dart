import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:flutter/material.dart';

class CartScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  const CartScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: context.colors.dark,
      backgroundColor: context.colors.dark,

      // leading: IconButton.filled(
      //   onPressed: () {
      //     context.pop();
      //   },
      //   style: IconButton.styleFrom(
      //     backgroundColor: context.colors.white.withOpacity(0.15),
      //   ),
      //   icon: Icon(Icons.chevron_left, size: 30.o, color: context.colors.white),
      // ),
      title: Text(
        'Cart',
        style: context.styles.s18w400.copyWith(color: context.colors.white),
      ),
      actions: [
        Text(
          "EDIT ITEMS",
          style: context.styles.s16w400.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: context.colors.orange,
            color: context.colors.orange,
          ),
        ),
      ],
    );
  }
}
