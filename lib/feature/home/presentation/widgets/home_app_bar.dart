import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'drop_down_botton_w.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: context.colors.white,
      backgroundColor: context.colors.white,

      // leading: IconButton.filled(
      //   onPressed: () {
      //     context.canPop();
      //   },
      //   style: IconButton.styleFrom(backgroundColor: context.colors.lightBlue),
      //   icon: Icon(
      //     Icons.chevron_left,
      //     size: 30.o,
      //     color: context.colors.darkGray,
      //   ),
      // ),
      title: CategoryDropdown(),

      actions: [
        IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: context.colors.black,
            padding: EdgeInsets.all(16.o),
          ),
          onPressed: () {},
          icon: SvgPicture.asset(context.icons.search),
        ),
        10.width,
        IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: context.colors.lightBlue,
            padding: EdgeInsets.all(16.o),
          ),
          onPressed: () {},
          icon: SvgPicture.asset(context.icons.filter),
        ),
      ],
    );
  }
}
