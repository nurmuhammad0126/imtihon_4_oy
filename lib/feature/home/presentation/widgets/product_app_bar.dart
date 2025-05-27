import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  const ProductAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: context.colors.white,
      backgroundColor: context.colors.white,

      leading: IconButton.filled(
        onPressed: () {
          context.pop();
        },
        style: IconButton.styleFrom(backgroundColor: context.colors.lightBlue),
        icon: Icon(
          Icons.chevron_left,
          size: 30.o,
          color: context.colors.darkGray,
        ),
      ),
      title: Text('Details', style: context.styles.s18w400),
    );
  }
}
